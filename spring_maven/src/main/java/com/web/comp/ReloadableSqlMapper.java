package main.java.com.web.comp;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.MutablePropertyValues;
import org.springframework.beans.PropertyValue;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.config.TypedStringValue;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.io.Resource;

public class ReloadableSqlMapper extends SqlSessionFactoryBean implements ApplicationContextAware, InfPathWatcher, DisposableBean
{
	private static final Logger logger = LoggerFactory.getLogger(ReloadableSqlMapper.class);

	ApplicationContext context;
	
	@Autowired
	DefaultListableBeanFactory listableBeanFactory;
	
	String mapperLocationsPattern = null;
	
	PathWatcher pathWatcher = null;
	
	String mapperRootPath;

	String beanName = "sqlFactory";
	
	boolean isAlive = true;

	public String getBeanName()
	{
		return beanName;
	}

	public void setBeanName(String beanName)
	{
		this.beanName = beanName;
	}

	
	@Override
	public void setDataSource(DataSource dataSource)
	{
		super.setDataSource(dataSource);
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException
	{
		this.context = applicationContext;
	}
	
	@Override
	public void nofitfyPathChange(String mapperPath, String targetFilename)
	{
		System.out.println(targetFilename + "감시중");
		try
		{
			System.out.println("SqlMapper...");
			refresh();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@Override
	public void destroy() throws Exception
	{
		isAlive = false;
		if (pathWatcher != null)
		{
			System.out.println("감시 종료");
			pathWatcher.closeWatcher();
		}		
	}

	 
	@Override
	public SqlSessionFactory getObject() throws Exception
	{
		System.out.println("getObject... ");
		
		extractProperty();

		return super.getObject();
	}
	
	
	@Override
	public void setMapperLocations(Resource[] mapperLocations)
	{
		super.setMapperLocations(mapperLocations);
		try
		{
			if (pathWatcher != null)
			{
				System.out.println("pathWatcher != null 감시중임...");
				return;
			}
			else
			{
				System.out.println("pathWatcher == null 감시중");
			}
			mapperRootPath = getSuffixAutomaton(mapperLocations);
			if (mapperRootPath != null && !mapperRootPath.equals(""))
			{
				// hook file system notification
				pathWatcher = PathWatcher.getInstance();
				pathWatcher.setPathParameter(mapperRootPath);
				pathWatcher.addObserver(this);
				pathWatcher.runWatcher();
			}
		}
		catch (Exception e)
		{			
			e.printStackTrace();
		}		
	}
	// ////////////////////////////////////////////////////////////////////////////////////
	
	String getSuffixAutomaton(Resource[] mapperLocations) throws Exception
	{
		List<String> path = new ArrayList<String>();
		for (Resource res : mapperLocations)
		{
			path.add(res.getFile().getPath());
		}

		UtilSuffixAutomaton automaton = new UtilSuffixAutomaton();

		String commonStr = "";

	
		for (String baseStr : path)
		{
			if (commonStr.equals(""))
			{
				commonStr = baseStr;
				continue;
			}
			commonStr = automaton.lcs(baseStr, commonStr);
		}

		File file = new File(commonStr);
		if (!file.isDirectory())
		{
			// get parent directory
			commonStr = file.getParent();
		}
		System.out.println("SqlSession xml 맵퍼 루트 = " + commonStr);
		return commonStr;
	}
	public void extractProperty()
	{
		if(this.mapperLocationsPattern != null )
		{
			return;
		}
	
		BeanDefinition beanDefinition = listableBeanFactory.getBeanDefinition(beanName);
		MutablePropertyValues values = beanDefinition.getPropertyValues();

		List<PropertyValue> list = values.getPropertyValueList();

		for (PropertyValue propertyValue : list)
		{
			Object objValue = propertyValue.getValue();
			if (objValue instanceof TypedStringValue)
			{
				TypedStringValue str = (TypedStringValue) objValue;
				String value = str.getValue();
				String key = propertyValue.getName();
				if ("mapperLocations".equals(key))
				{
					this.mapperLocationsPattern = value;
				}
			}
		}
	}
	
	public void refresh() throws Exception
	{
		Resource[] resources = context.getResources(mapperLocationsPattern);

		setMapperLocations(resources);
		this.afterPropertiesSet();
	}
}
