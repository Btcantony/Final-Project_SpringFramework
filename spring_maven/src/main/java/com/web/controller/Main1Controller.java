package main.java.com.web.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.log4j.Logger;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import main.java.com.web.dto.Join;
import main.java.com.web.dto.MainBestBrand;
import main.java.com.web.dto.MainJust;
import main.java.com.web.dto.Master;
import main.java.com.web.dto.Notice;
import main.java.com.web.dto.ProductImgs;
import main.java.com.web.service.Main1Service;

@Controller
@RequestMapping("/main1")
public class Main1Controller {

	//private Logger logger = Logger.getLogger(Main1Controller.class);

	@Resource(name = "main1Service")
	private Main1Service main1Service;                       

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {
		
//		// 스와이프 이미지 가지고 오기
//		List<MainSwiperImg> listMainSwiperImg = main1Service.select_main_swiper();
//		req.setAttribute("listMainSwiperImg", listMainSwiperImg);
//				
//		// 메인카테고리 
//		List<MainCategory> listMainCategory = main1Service.select_main_category();
//		req.setAttribute("listMainCategory", listMainCategory);
//		
//		// 메인 저스트
//		List<MainJust> listMainJust = main1Service.select_main_just();
//		req.setAttribute("listMainJust", listMainJust);
//		3가지 기능을 전부 합쳐서 Master의 master에 던져줌. master안에는 3가지 기능을 수행할 동작이 담겨있음. 
		
		
// 		한편, main_just는 더보기 버튼을 누를 때에만 화면에 추가 로딩하도록 비동기방식으로 처리할 것임.
// 		JUST 페이징 처리
//		일단 초기 localhost:8080/main1/index 화면에는 동기방식으로 4장이 보이도록 값을 지정.
		MainJust mainJust = new MainJust();
		mainJust.setSt_num(0);
		mainJust.setEd_num(4);
		master.setMainJust(mainJust);
		
		req.setAttribute("master", main1Service.select_main(master));
		
		return "main1/index";     
	}
	
	//MainJust영역에서 더보기버튼 눌렀을 때 활성화되는 컨트롤러
	@RequestMapping(value = "/ajax_just", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_just(HttpServletRequest req, HttpServletResponse res, Master master) {
		MainJust mainJust = new MainJust();
		mainJust.setSt_num(master.getMainJust().getSt_num());
		mainJust.setEd_num(4);
		master.setMainJust(mainJust);
				
		master.setListMainJust(main1Service.select_main_just(mainJust));
		return new Gson().toJson(master);
	}

	@RequestMapping(value = "/init_ajax_brand", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String init_ajax_brand(HttpServletRequest req, HttpServletResponse res, Master master) {
		List<MainBestBrand> listMainBestBrand =  main1Service.select_main_brand();
		master.setListMainBestBrand(listMainBestBrand);
		return new Gson().toJson(master);
	}		
	
	
	
	
//	-----------------------------게시판---------------------------------------------------------
	
	@RequestMapping(value = "/regist_notice", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String regist_notice(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {
		HttpSession session = req.getSession();
		Join join = (Join)session.getAttribute("join");
		
		if(join == null) return "redirect:/main1/index";
		else return "main1/regist_notice";     
	}
	
	@RequestMapping(value = "/submit_notice", method = RequestMethod.POST, produces = "application/text; charset=utf8")                
	public String submit_notice(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {				
		// 공지사항 등록		
		boolean isMultipart = ServletFileUpload.isMultipartContent(req); // multipart로 전송되었는가를 체크
		if (isMultipart) {
			// 경로 설정 START
			ServletContext context = req.getSession().getServletContext();
			String root = context.getRealPath("/");
			File temporaryDir = new File(root + "/resources/");
			String realDir = root + "/resources/files/";
			// 경로 설정 END
			
			// 파일 GET START
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setRepository(temporaryDir);
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(new ServletRequestContext(req));
			Iterator iter = items.iterator();
			// 파일 GET END
			
			Notice notice = new Notice();				
			while (iter.hasNext()) {
				FileItem fileItem = (FileItem) iter.next(); // 파일을 가져온다
				if (fileItem.isFormField()) {					
					if(fileItem.getFieldName().equals("title")) notice.setTitle(fileItem.getString("utf-8"));
					if(fileItem.getFieldName().equals("content")) notice.setContent(fileItem.getString("utf-8"));					
				} else { // 파일이면 이부분의 루틴을 탄다
					if (fileItem.getSize() > 0) { // 파일이 업로드 되었나 안되었나 체크 size>0이면 업로드 성공
						UUID uuid = UUID.randomUUID();
						String realName = fileItem.getName();
						int pos = realName.lastIndexOf(".");
						String extendName = realName.substring(pos + 1);
						String fileName = uuid.toString() + "." + extendName;
						String size = String.valueOf(fileItem.getSize());
						
						File uploadedFile = new File(realDir, fileName); // 실제 디렉토리에 fileName으로 카피 된다.
						fileItem.write(uploadedFile);
						fileItem.delete();
						
						notice.setImg_url("/resources/files/"+fileName);
					}
				}				
			}
			
			HttpSession session = req.getSession();
			Join join = (Join)session.getAttribute("join");			
			notice.setEmail(join.getEmail());
			main1Service.insert_notice(notice);
			
			System.out.println(new Gson().toJson(notice));
		}
		return "redirect:/main1/notice";
	}
	
	@RequestMapping(value = "/notice")                
	public String notice(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "main1/notice";     
	}
	
	@RequestMapping(value = "/ajax_notice", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_notice(HttpServletRequest req, HttpServletResponse res, Master master) {
		// 화면에서 값 바인딩
		Notice notice = master.getNotice();
		List<Notice> listNotice = main1Service.select_notice(notice);
		
		if(notice.getKeyword() != null && !notice.getKeyword().equals("")) {
			for(Notice n : listNotice) {
				n.setKeyword(notice.getKeyword());
			}
		}
		
		master.setListNotice(listNotice);
		
		//master.setListNotice(mainService.select_notice(master.getNotice()));
		return new Gson().toJson(master);
	}
//	--------------------------------------------------------------------------------------
	// 삭제
	@RequestMapping(value = "/ajax_notice_delete", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_notice_delete(HttpServletRequest req, HttpServletResponse res, Master master) {				
		main1Service.delete_notice(master.getNotice().getSeq());
		return new Gson().toJson(master);
	}
	
	// 게시글 수정
	@RequestMapping(value = "/update_notice", method = RequestMethod.GET, produces = "application/text; charset=utf8")                
	public String update_notice(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {
		req.setAttribute("seq",master.getNotice().getSeq());
	return "main1/update_notice";	
	} 
	
	// 수정 submit버튼
	@RequestMapping(value = "/update_notice_action", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String update_notice_action(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {		

		// 공지사항 등록		
		boolean isMultipart = ServletFileUpload.isMultipartContent(req); // multipart로 전송되었는가를 체크
		if (isMultipart) {			
			// 경로 설정 START
			ServletContext context = req.getSession().getServletContext();
			String root = context.getRealPath("/");
			File temporaryDir = new File(root + "/resources/");
			String realDir = root + "/resources/files/";
			// 경로 설정 END
			
			// 파일 GET START
			DiskFileItemFactory factory = new DiskFileItemFactory(); //저장소
			factory.setRepository(temporaryDir); //담고
			ServletFileUpload upload = new ServletFileUpload(factory); //객체로 넘어온 파일을 FIleItem형식으로 변환
			List<FileItem> items = upload.parseRequest(new ServletRequestContext(req)); //List로 업로드 
			Iterator iter = items.iterator(); //List형식의 파일을 개별적으로 분리위해 (key 값을 모르니 Map사용 X)
			// 파일 GET END
			
			Notice notice = new Notice();				
			while (iter.hasNext()) {
				FileItem fileItem = (FileItem) iter.next(); // 파일을 가져온다
				if (fileItem.isFormField()) {					
					if(fileItem.getFieldName().equals("title")) notice.setTitle(fileItem.getString("utf-8"));
					if(fileItem.getFieldName().equals("content")) notice.setContent(fileItem.getString("utf-8"));
					if(fileItem.getFieldName().equals("seq")) notice.setSeq(Integer.parseInt(fileItem.getString("utf-8")));
				} else { // 파일이면 이부분의 루틴을 탄다
					if (fileItem.getSize() > 0) { // 파일이 업로드 되었나 안되었나 체크 size>0이면 업로드 성공
						UUID uuid = UUID.randomUUID(); //파일명 중복 방지 
						String realName = fileItem.getName();
						int pos = realName.lastIndexOf(".");
						String extendName = realName.substring(pos + 1);
						String fileName = uuid.toString() + "." + extendName;
						String size = String.valueOf(fileItem.getSize());
						
						File uploadedFile = new File(realDir, fileName); // 실제 디렉토리에 fileName으로 카피 된다.
						fileItem.write(uploadedFile);
						fileItem.delete();
						
						notice.setImg_url("/resources/files/"+fileName);
					}
				}				
			}
						
			main1Service.update_notice(notice);
			
			System.out.println(new Gson().toJson(notice));
		}
		
		return "redirect:/main1/notice";
	}	
	
	
	
	
	@RequestMapping(value = "/ajax_update_notice_action", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_update_notice_action(HttpServletRequest req, HttpServletResponse res, Master master) {		
		
		return new Gson().toJson(master);
	}
	
//	--------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/ajax_notice_total", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_notice_total(HttpServletRequest req, HttpServletResponse res, Master master) {		
		int total_notice_cnt = main1Service.select_notice_total();
		master.setTotal_cnt(total_notice_cnt);
		return new Gson().toJson(master);
	}
	
	@RequestMapping(value = "/ajax_notice_detail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_notice_detail(HttpServletRequest req, HttpServletResponse res, Master master) {		
		master.setNotice(main1Service.select_notice_detail(master.getNotice().getSeq()));
		return new Gson().toJson(master);
	}
	
	@RequestMapping(value = "/notice_detail", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String notice_detail(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {
		req.setAttribute("seq",master.getNotice().getSeq());
		return "main1/notice_detail";     
	}
	
	@RequestMapping(value = "/product_detail", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String product_detail(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {
		req.setAttribute("seq",master.getMainJust().getSeq());
		return "main1/product_detail";     
	}	
	
	@RequestMapping(value = "/ajax_product_detail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_product_detail(HttpServletRequest req, HttpServletResponse res, Master master) {
		// seq 값으로 JUST 상세 조회
		MainJust mainJust = main1Service.select_product_detail(master.getMainJust().getSeq());
		master.setMainJust(mainJust);
		
		// 상세 이미지들
		ProductImgs productImgs = new ProductImgs();
		productImgs.setType("just");
		productImgs.setSub_seq(master.getMainJust().getSeq());
		List<ProductImgs> listProductImgs = main1Service.select_ProductImgs(productImgs);
		master.setListProductImgs(listProductImgs);
		
		// 데이터만 리턴
		return new Gson().toJson(master);
	}  
	
	
//	---------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/search_product")                
	public String search_product(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "main1/search_product";     
	}
	
	
	@RequestMapping(value = "/ajax_search_product", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_search_product(HttpServletRequest req, HttpServletResponse res, Master master, @RequestParam("keyword") String keyword) {
		
		List<MainJust> listMainJust = main1Service.select_search_product(keyword);
		
		master.setListMainJust(listMainJust);
				
		return new Gson().toJson(master);
	}
	
	

	
	
//	------------------------------------------정훈-------------------------------------------------------------------------
	
	@RequestMapping(value = "/category_detail", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String category_detail(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {
		req.setAttribute("category",master.getMainCategory().getCategory());
		return "main1/category_detail";     
	}	
	
	@RequestMapping(value = "/ajax_category_detail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_category_detail(HttpServletRequest req, HttpServletResponse res, Master master) {
		
		String category = master.getMainCategory().getCategory();
		List<MainJust> listMainJust =  main1Service.select_category_detail(category);
		
		master.setListMainJust(listMainJust);
		return new Gson().toJson(master);
	}  
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


