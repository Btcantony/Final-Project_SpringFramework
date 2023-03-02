package main.java.com.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.java.com.web.dto.Addr;
import main.java.com.web.dto.MainBestBrand;
import main.java.com.web.dto.MainCategory;
import main.java.com.web.dto.MainJust;
import main.java.com.web.dto.MainSwiperImg;
import main.java.com.web.dto.Master;
import main.java.com.web.dto.Notice;
import main.java.com.web.dto.ProductImgs;

@Repository("main1Dao")
public class Main1Dao {

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public String selectTest() throws Exception {
		return sqlSession.selectOne("Main1.test");
	}

	public List<MainSwiperImg> select_main_swiper() {
		return sqlSession.selectList("Main1.select_main_swiper");
	}

	public List<MainCategory> select_main_category() {
		return sqlSession.selectList("Main1.select_main_category");
	}

	public List<MainJust> select_main_just(MainJust mainJust) {
		return sqlSession.selectList("Main1.select_main_just", mainJust);
	}

	public List<MainBestBrand> select_main_brand() {
		return sqlSession.selectList("Main1.select_main_brand");
	}

	// 첫번째 줄은 resultType이고 , ""안은 Main1 xml id , value값 parametertype
	public List<Notice> select_notice(Notice notice) {
		return sqlSession.selectList("Main1.select_notice", notice);
	}

	public void insert_notice(Notice notice) {
		sqlSession.insert("Main1.insert_notice", notice);
	}

	public Notice select_notice_detail(int seq) {
		return sqlSession.selectOne("Main1.select_notice_detail", seq);
	}

	public int select_notice_total() {
		return sqlSession.selectOne("Main1.select_notice_total");
	}

	public MainJust select_product_detail(int seq) {
		return sqlSession.selectOne("Main1.select_product_detail", seq);
	}

	public List<ProductImgs> select_ProductImgs(ProductImgs productImgs) {
		return sqlSession.selectList("Main1.select_ProductImgs", productImgs);
	}

	public void delete_notice(int seq) {
		sqlSession.delete("Main1.delete_notice", seq);

	}

	public void update_notice(Notice notice) {
		sqlSession.update("Main1.update_notice", notice);

	}

	public List<MainJust> select_search_product(String keyword) {
		Map<String, String> paramMap = new HashMap<String, String>();

		paramMap.put("keyword", keyword);
		return sqlSession.selectList("Main1.select_search_product", paramMap);
	}

	public MainCategory select_maincategory_detail(MainCategory mainCategory) {
		return sqlSession.selectOne("Main1.select_maincategory_detail", mainCategory);
	}

	public List<MainJust> select_category_detail() {
		return sqlSession.selectList("Main1.select_category_detail");
	}

	public List<MainJust> select_category_detail(String category) {
		return sqlSession.selectList("Main1.select_category_detail", category);
	}

}
