package main.java.com.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mysql.cj.log.Log;
import com.mysql.cj.log.LogFactory;

import main.java.com.web.dto.MainBestBrand;
import main.java.com.web.dto.MainJust;
import main.java.com.web.dto.Addr;
import main.java.com.web.dto.Item;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.Master;
import main.java.com.web.dto.Order;
import main.java.com.web.service.Login1Service;
import main.java.com.web.util.DateHelper;
import main.java.com.web.util.HwangHelper;

@Controller
@RequestMapping("/login1")
public class Login1Controller {
	//private Logger logger = Logger.getLogger(Login1Controller.class);
	private Logger logger = LoggerFactory.getLogger(Login1Controller.class);
	
	
	@Resource(name = "login1Service")
	private Login1Service login1Service; 
	
	@RequestMapping(value = "/log")
	public String log(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "login1/log";     
	}	
	
	@RequestMapping(value = "/join")
	public String join(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "login1/join";     
	}
	
	//회원가입 페이지에서 회원가입버튼이 눌리면 수행할 내용들. 
	@RequestMapping(value = "/ajax_join", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_join(HttpServletRequest req, HttpServletResponse res, Master master) {
		//회원가입에 적은 정보를 master가 가지고 있으니 그것을 get으로 가져와서 DAO 인 join에 담자.
		System.out.print("login@@@@@");
		Join join = master.getJoin();
		int cnt = login1Service.isMember(join);
		if(cnt == 0) {
			//dao인 join이 정보를 가지고있으니 우리 db에 담는작업인 insert_user를 실행해서 db에 저장하자.
			login1Service.insert_user(join);
		} else {
			master.getJoin().setUser_count(1);
		}
		//db에 저장뿐만 아니라 master에 담았던 정보를 비동기로(우리db에 변동이 생겼지만 화면을 새로고침하지않아도 적용되도록 POST방식으로 작성했었다..)
		return new Gson().toJson(master);				
	}
	
	@RequestMapping(value = "/ajax_checkKakaoLogin", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_checkKakaoLogin(HttpServletRequest req, HttpServletResponse res, Master master) {		
		Join join = master.getJoin();
		// 회원 인지?
		int cnt = login1Service.isMember(join);
		
		// 비회원이면
		if(cnt == 0) {
			join.setPassword(""); //카카오톡으로 시작한 유저는 비번이 없고 
			join.setPhone_num(""); // 폰번호도 없이 시작하게 설정..
			login1Service.insert_user(join);
		}
							
		return new Gson().toJson(master);	
		
	}		
	
	
	
	// 이메일과 비번 다 입력하고 로그인하기 버튼을 누르면 수행할 내용들..
	@RequestMapping(value = "/ajax_login", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_login(HttpServletRequest req, HttpServletResponse res, Master master) {			
		
		// 로그인페이지에서 적은 정보가 기존에 우리 db에 있는 회원정보인지 가져와서 확인하는 작업을 수행하고, 
		// db에 있는 정보의 유저 count가 1이라면 로그인을 성공시켜준다.
		master.getJoin().setUser_count(login1Service.select_user_count(master.getJoin()));
		
		// 세션 처리 
		if(master.getJoin().getUser_count() == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("join", master.getJoin());
		}
		return new Gson().toJson(master);
	}
	
	// header 부분에서 반응할 내용. 로그인이 된 상태라면 로그인버튼은 보이면 안되고 로그아웃버튼만 보여야지.
	@RequestMapping(value = "/ajax_isLogin", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_isLogin(HttpServletRequest req, HttpServletResponse res, Master master) {			
		HttpSession session = req.getSession();
		Join join = (Join)session.getAttribute("join");
		master.setJoin(join);
		return new Gson().toJson(master);
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {							
		req.getSession().invalidate();		
		return "redirect:/main1/index";		
	}
	
//	------------------------------------------------------------------------
	
	@RequestMapping(value = "/mywish")
	public String mywish(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "login1/mywish";       
	}
	
	
	@RequestMapping(value = "/mypoint")
	public String mypoint(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "login1/mypoint";       
	}	
	
	@RequestMapping(value = "/myorderlist")
	public String myorderlist(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "login1/myorderlist";       
	}	
//	--------------------------------------------내 프로필 메뉴 진입 시 보여지는 유저 정보들 로직 정훈--------------------------------------------------------
	
	
	@RequestMapping(value = "/myprofile")
	public String myprofile(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "login1/myprofile";       
	}	
	
	@RequestMapping(value = "/ajax_myprofile", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_myprofile(HttpServletRequest req, HttpServletResponse res, Master master) {		

		HttpSession session = req.getSession();
		Join join = (Join)session.getAttribute("join");
		master.setJoin(join);
		
		String email = master.getJoin().getEmail();
		
		Join myinfo =  login1Service.select_my_profile(email);
		master.setJoin(myinfo);
		
		return new Gson().toJson(master);
	}		
	
//	---------------------------------------------로그인한 유저가 본인 배송지를 추가하는 로직 정훈-------------------------------------------------------------
	
	@RequestMapping(value = "/myaddress")
	public String myaddress(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "login1/myaddress";       
	}	
	
	@RequestMapping(value = "/ajax_myaddress", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_myaddress(HttpServletRequest req, HttpServletResponse res, Master master) {		

		HttpSession session = req.getSession();
		Join join = (Join)session.getAttribute("join");
		master.setJoin(join);
		
		String email = master.getJoin().getEmail();
		
		List<Addr> listAddr =  login1Service.select_addr_all(email);
		master.setListAddr(listAddr);
		
		
		return new Gson().toJson(master); //DB에 있는 neooper@naver.com 의 배송지들 정보를 조회하기위한 코드
	}		
	
	
	@RequestMapping(value = "/ajax_insert_myaddress", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public @ResponseBody String ajax_insert_myaddress(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {
		try {			
			Addr addr = master.getAddr();
			HwangHelper hwangHelper = new HwangHelper();
			Join join = hwangHelper.getSession(req);			
			addr.setEmail(join.getEmail());
			
			login1Service.insert_myaddress(addr);
			master.success();
		} catch (Exception e) {
			master.fail("xxxx", e.toString());
		}
		
		return new Gson().toJson(master); // 배송지를 추가하면 form submit 받아 db에 넣는 코드
	}
	
	
//	------------------my buy페이지 상품, 주소, 포인트 불러오기 -------------------------------------------------------------------------------------------------------------------
		
	
	@RequestMapping(value = "/mybuy", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String mybuy(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "login1/mybuy";     
	}
	
	@RequestMapping(value = "/ajax_buy", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_buy(HttpServletRequest req, HttpServletResponse res, Master master) {		
		System.out.println(new Gson().toJson(master));
		
		// 내 정보
		HttpSession session = req.getSession();
		Join join = (Join)session.getAttribute("join");
		master.setJoin(join);
		
		// 내 주소
		Addr addr = new Addr();
		addr.setEmail(join.getEmail());
		addr.setAddr_type("home");
		addr = login1Service.select_addr(addr);
		master.setAddr(addr);
		
		// 주소 목록
		List<Addr> listAddr =  login1Service.select_addr_all(join.getEmail());
		master.setListAddr(listAddr);
		
		// 내 포인트
		int total_point = login1Service.select_point(join.getEmail());
		master.setTotal_point(total_point);
		
		return new Gson().toJson(master);
	}	
	
//	-------------------구매로직-------------------------------------------------------------------------------------------------------------------
	
	//mywish에서 mybuy로 넘어가는것 
	
	@RequestMapping(value = "/ajax_buy_commit", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_buy_commit(HttpServletRequest req, HttpServletResponse res, Master master) {		
				
		//디버깅 테스트
		System.out.println(new Gson().toJson(master));
		
		Order order = master.getOrder();
		// 주문 번호 생성 (ajax_buy_commit 과 동시에 현재시간과 이메일의 합으로 만드는 스트링타입) 
		String email = new HwangHelper().getSession(req).getEmail();
		String orderNum = new DateHelper().yyyymmddhhmmss()+"_"+ email;
		String orderDate = new DateHelper().yyyymmdd();
		
		order.setOrderNum(orderNum);
		order.setCancel_yn("N");
		order.setDeliver_yn("N");
		order.setEmail(email);
		order.setOrderDate(orderDate);
		order.setAddr_total(order.getAddr_total());
		order.setDeliver_type(order.getDeliver_type());
		order.setPoint_pay(order.getPoint_pay());      // mybuy에서 포인트 모두사용 누르면 그 만큼의 값을 db에 insert
		login1Service.insert_order(order);
		
		int i = 0;
		for (Item item : order.getListItem()) {
			item.setOrderNum(orderNum);
			item.setBrand(order.getListItem().get(i).getBrand());
			item.setName(order.getListItem().get(i).getName());
			item.setUrl(order.getListItem().get(i).getUrl());
			item.setSeq(order.getListItem().get(i).getSeq());
			item.setPrice(order.getListItem().get(i).getPrice());
			login1Service.insert_item(item);
			i++;
		}
		
		// 포인트 차감 아직
		return new Gson().toJson(master);
	}  
	
	@RequestMapping(value = "/ajax_myorderlist", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String ajax_myorderlist(HttpServletRequest req, HttpServletResponse res, Master master) {		
		
		//디버깅 테스트
		System.out.println(new Gson().toJson(master));
		
		String email = new HwangHelper().getSession(req).getEmail();
		master.getOrder().setEmail(email);
		List<Order> listOrder = login1Service.select_order_all(master.getOrder());
		
		for (Order order : listOrder) {
			List<Item> listItem = login1Service.select_order_items(order.getOrderNum());
			order.setListItem(listItem);
		}
		master.setListOrder(listOrder); // master에 set을 안해줘서 안됐구먼....
		
		// 상품 상태코드 총 개수 
		Order orderDb = new Order();
		orderDb.setEmail(email);
		orderDb = login1Service.select_order_all_cnt(orderDb);
		
		master.getOrder().setDeliver_yn_n_cnt(orderDb.getDeliver_yn_n_cnt());
		master.getOrder().setDeliver_yn_y_cnt(orderDb.getDeliver_yn_y_cnt());
		master.getOrder().setDeliver_yn_f_cnt(orderDb.getDeliver_yn_f_cnt());
		
		return new Gson().toJson(master);
	}  
	
//	----------------------------------------------------------------------------------------------------------------------------------------
	
	
	@RequestMapping(value = "/mypayment")
	public String mypayment(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {					
		return "login1/mypayment";       
	}	
	
	
	

	
	
}