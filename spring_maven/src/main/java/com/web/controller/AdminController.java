package main.java.com.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import main.java.com.web.dto.Addr;
import main.java.com.web.dto.Admin;
import main.java.com.web.dto.AdminNotice;
import main.java.com.web.dto.Files;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.MainJust;
import main.java.com.web.dto.Master;
import main.java.com.web.dto.OrderStatistics;
import main.java.com.web.service.AdminService;
import main.java.com.web.util.DateHelper;
import main.java.com.web.util.DevHelper;
import main.java.com.web.util.HwangHelper;
import main.java.com.web.util.ImgHelper;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LogManager.getLogger(AdminController.class);

	@Resource(name = "adminService")
	private AdminService adminService;
	
	@RequestMapping(value = "/")
	public String index(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {		
		return "admin/index";
	}
	
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {				
		return "admin/login";
	}	
	
	@RequestMapping(value = "/ajax_login", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public @ResponseBody String ajax_login(HttpServletRequest req, HttpServletResponse res, Master m) throws Exception {
		try {
			// 아이디 비번 받아서 로그인 처리
			logger.info("teeeeeeeeeeeeeeeeeeeeeeee");
			logger.info("teeeeeeeeeeeeeeeeeeeeeeee");
			logger.info("teeeeeeeeeeeeeeeeeeeeeeee");
			logger.info("teeeeeeeeeeeeeeeeeeeeeeee");
			logger.info("teeeeeeeeeeeeeeeeeeeeeeee");
			logger.info("teeeeeeeeeeeeeeeeeeeeeeee");
			logger.info("teeeeeeeeeeeeeeeeeeeeeeee");
			logger.info("teeeeeeeeeeeeeeeeeeeeeeee");
			logger.info("teeeeeeeeeeeeeeeeeeeeeeee");
			logger.info("teeeeeeeeeeeeeeeeeeeeeeee");
			Admin admin = adminService.select_admin(m.getAdmin());
			if(admin == null) {
				m.fail("xxxx", "아이디 비밀번호가 일치하지 않습니다.");
			}else {
				// 세션이 담는다.
				DevHelper devHelper = new DevHelper();
				devHelper.setSession(req, admin, "admin");
				m.success();
			}						
		} catch (Exception e) {
			m.fail("xxxx", e.toString());
			logger.error(e.getMessage(), e);
		}
		
		return new Gson().toJson(m);
	}	
	
	//회원탈퇴페이지 준현
	@RequestMapping(value = "/user_view")
	public String user_view(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {		
		return "admin/user_view";
	}	
	
	//회원탈퇴페이지 준현
	@RequestMapping(value = "/ajax_user_view", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public @ResponseBody String ajax_user_view(HttpServletRequest request, HttpServletResponse response, Master master) throws Exception {
		
		//띄우는것만 하니 파라미터가 필요가 없고, 위에 setEmail넣는게 필요가 없음
		try {
			List<Join> listJoin = adminService.select_listJoin();
			master.setListJoin(listJoin);
			master.success();
			
			
		} catch (Exception e) {
			master.fail("xxxx", e.toString());
		}
		
		return new Gson().toJson(master);
	}		
	
	
	//회원 삭제
	@RequestMapping(value = "/ajax_user_delete", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_user_delete(HttpServletRequest httpServletRequest, HttpServletResponse response, Master master) {					
				
		System.out.println(new Gson().toJson(master));
		
		String[] str = master.getJoin().getEmails().split(",");
		//체크된 숫자를 나누기 위해
		for (String s : str) {
			adminService.delete_user(s);
		}
		
				
		return new Gson().toJson(master);
	}
	
	
	
//	MAINJUST --------------------------------------------------------------------------------------	
	
	@RequestMapping(value = "/main_just")
	public String main_just(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {		
		return "admin/main_just";
	}
	
	@RequestMapping(value = "/detail_main_just")
	public String detail_main_just(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {		
		return "admin/detail_main_just";
	}
		
	@RequestMapping(value = "/ajax_main_just", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public @ResponseBody String ajax_main_just(HttpServletRequest request, HttpServletResponse response, Master master) throws Exception {
		System.out.println(master);
		try {
			DevHelper devHelper = new DevHelper();
			Admin admin = (Admin)devHelper.getSession(request, "admin");
			List<MainJust> listMainJust = adminService.select_listMainJust(admin.getEmail());			
			master.setListMainJust(listMainJust);
			master.success();
		} catch (Exception e) {
			master.fail("xxxx", e.toString());
		}
		
		return new Gson().toJson(master);
	}		
	
	// 9/2 - 2 등록 수정 삭제 같이 
	@RequestMapping(value = "/ajax_ins_upd_del_main_just", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public @ResponseBody String ajax_ins_upd_del_main_just(HttpServletRequest request, HttpServletResponse response, Master master) throws Exception {
		try {						
			MainJust mainJust = master.getMainJust();
			
			if(mainJust.getCmd().equals("insert")) {
				DevHelper devHelper = new DevHelper();
				Admin admin = (Admin)devHelper.getSession(request, "admin");			
				mainJust.setUser(admin.getEmail());			
				adminService.insert_main_just(mainJust);
			}else if(mainJust.getCmd().equals("update")) {
				adminService.update_main_just(mainJust);
			}else if(mainJust.getCmd().equals("delete")) {
				String[] str = mainJust.getSeqs().split(",");
				//체크된 숫자를 나누기 위해
				for (String s : str) {
					adminService.delete_main_just(Integer.parseInt(s));
				}
			}
						
			master.success();
		} catch (Exception e) {
			master.fail("xxxx", e.toString());
		}
		
		return new Gson().toJson(master);
	}
	
	//9/2 - 1 
	//게시물 수정 detail_main_just의 seq를 받아라 시킴 
	@RequestMapping(value = "/ajax_detail_main_just", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public @ResponseBody String ajax_detail_main_just(HttpServletRequest request, HttpServletResponse response, Master master) throws Exception {
	System.out.println(master);
		try {			
			int seq = master.getMainJust().getSeq();
			MainJust mainJust = adminService.select_mainJust_one(seq);
			master.setMainJust(mainJust);			
			master.success();
		} catch (Exception e) {
			master.fail("xxxx", e.toString());
		}
		
		return new Gson().toJson(master);
	}
	
//	MAINSWIPER --------------------------------------------------------------------------------------		
	
	@RequestMapping(value = "/main_swiper")
	public String main_swiper(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {		
		return "admin/main_swiper";
	}
	
	@RequestMapping(value = "/insert_main_swiper")
	public String insert_main_swiper(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {		
		return "admin/insert_main_swiper";
	}
	
		
	
//	MAINBESTBRAND --------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/main_best")
	public String main_best(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {		
		return "admin/main_best";
	}
	
	@RequestMapping(value = "/insert_main_best")
	public String insert_main_best(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {		
		return "admin/insert_main_best";
	}
	
//	--------------------------------------------------------------------------------------	
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public @ResponseBody String fileUpload(HttpServletRequest request, HttpServletResponse response, Master master)
			throws Exception {
		try {			
			ImgHelper imgHelper = new ImgHelper();
			Files files = imgHelper.saveImg(request, adminService);
			master.setFiles(files);
			master.success();
		} catch (IOException e) {
			master.fail("xxxx", e.toString());
		}
		return new Gson().toJson(master);
	}	
	
	@RequestMapping(value = "/ajax_order_statistics", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public @ResponseBody String ajax_order_statistics(HttpServletRequest request, HttpServletResponse response, Master master)
	throws Exception {
		try {		
			// 최근 일주일			
			List<String> dates = new DateHelper().yyyyMMdd_before(7);
			
			// 최근 일주일 주문 금액
			List<OrderStatistics> listOrderStatistics = new ArrayList<OrderStatistics>();
			for (String dt : dates) {
				int totalPrice = adminService.select_order_statistics(dt);
				OrderStatistics os = new OrderStatistics();
				os.setDt(dt);
				os.setTotal_price(totalPrice);
				listOrderStatistics.add(os);
			}
			master.setListOrderStatistics(listOrderStatistics);
			
			// MAIN JUST 카테고리 통계
			List<OrderStatistics> listCateStatistics = new ArrayList<OrderStatistics>();
			List<String> categorys = adminService.select_mainjust_distinct();
			for (String cate : categorys) {
				int totalCnt = adminService.select_cate_statistics(cate);
				OrderStatistics ct = new OrderStatistics();
				ct.setDt(cate);
				ct.setTotal_price(totalCnt);
				listCateStatistics.add(ct);
			}
			master.setListCateStatistics(listCateStatistics);
			master.success();
		} catch (Exception e) {
			master.fail("xxxx", e.toString());
		}
		return new Gson().toJson(master);
	}	

//	공지사항 게시판 준현 --------------------------------------------------------------------------------------
	
	
	@RequestMapping(value = "/board_list")                
	public String board_list(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "admin/board_list";     
	}
	
	//게시판 -- 목록 조회
	@RequestMapping(value = "/select_adminnotice_list", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String select_adminnotice_list(HttpServletRequest request, HttpServletResponse response, Master master) {		
		// 화면에서 값 바인딩
		DevHelper devHelper = new DevHelper();
		Admin admin = (Admin)devHelper.getSession(request, "admin");
		//띄우는건 파라미터 필요x
		List<AdminNotice> listAdminNotice = adminService.select_adminnotice_list();
		
		master.setListAdminNotice(listAdminNotice);
				
		return new Gson().toJson(master);
		}

	
	
//	게시판 등록 --------------------------------------------------------------------------------------
	@RequestMapping(value = "/board_regist")
	public String board_regist(HttpServletRequest request, HttpServletResponse response, Master master) throws Exception {
		return "admin/board_regist";
	}
	
	
	//게시글 등록 ajax
	@RequestMapping(value = "/submit_board_regist", method = RequestMethod.POST, produces = "application/text; charset=utf8")                
	public @ResponseBody String submit_board_regist(HttpServletRequest request, HttpServletResponse response, Master master) throws Exception {
		

		// TODO : 이렇게 받으면 안되요. 화면에서 adminNotice... 으로 보냈으니깐 296번줄 처럼 받아야됩니다.
		//AdminNotice adminNotice = new AdminNotice();
		
		// 이렇게 받아야 됩니다.
		AdminNotice adminNotice = master.getAdminNotice();
		
		//누가 작성했나 알아야 하니까 파라미터 필
		DevHelper devHelper = new DevHelper();
		Admin admin = (Admin)devHelper.getSession(request, "admin");
		
		adminNotice.setEmail(admin.getEmail());
		adminService.insert_adminnotice(adminNotice);
			
	
		
		return new Gson().toJson(master);
		
		//방법2		return "redirect:/admin/board_list";
		
	}
	
	
//	게시글 삭제 --------------------------------------------------------------------------------------
	@RequestMapping(value = "/ajax_adminnotice_delete", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_notice_delete(HttpServletRequest request, HttpServletResponse response, Master master) {						
		
//		//누가 작성했나 알아야 하니까 파라미터 필
//		DevHelper devHelper = new DevHelper();
//		Admin admin = devHelper.getSession(request);
		
		String[] str = master.getAdminNotice().getSeqs().split(",");
		//체크된 숫자를 나누기 위해
		for (String s : str) {
			adminService.delete_adminnotice(Integer.parseInt(s));
		}
		
				
		return new Gson().toJson(master);
	}
	
		
//	게시글 상세보기 --------------------------------------------------------------------------------------
	@RequestMapping(value = "/board_detail")
	public String board_detail(HttpServletRequest request, HttpServletResponse response, Master master) {
		
//		DevHelper devHelper = new DevHelper();
//		Admin admin = devHelper.getSession(request);
//		request.setAttribute("seq", master.getAdminNotice().getSeq());
		
		return "admin/board_detail";
	}
		
	//게시글 상세보기 (seq 정보 보내기)
	@RequestMapping(value = "/ajax_board_detail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_notice_detail(HttpServletRequest request, HttpServletResponse response, Master master) {		
		
		System.out.println(new Gson().toJson(master));
		
		int seq = master.getAdminNotice().getSeq();		
		AdminNotice adminNotice = adminService.select_adminnotice_detail(seq);
		
		master.setAdminNotice(adminNotice);
		return new Gson().toJson(master);
	}
	
//	게시글 수정 in 상세 --------------------------------------------------------------------------------------
	@RequestMapping(value = "/ajax_adminnotice_update", method = RequestMethod.POST, produces = "application/text; charset=utf8")                
	public @ResponseBody String ajax_adminnotice_update(HttpServletRequest request, HttpServletResponse response, Master master) throws Exception {
				
		System.out.println(new Gson().toJson(master));
		
		
		// 이렇게 받아야 됩니다.
		AdminNotice adminNotice = master.getAdminNotice();
		
		adminService.update_adminnotice(adminNotice);
		
		return new Gson().toJson(master);
	}
}
