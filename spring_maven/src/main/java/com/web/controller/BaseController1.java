package main.java.com.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import main.java.com.web.dto.Master;

@Controller
@RequestMapping("")
public class BaseController1 {
	//private Logger logger = Logger.getLogger(BaseController1.class);

	// BaseController가 필요한 이유 
	// 로그인버튼 누르고 우리가 로그인을 성공했다면 그 상태를 세션(session)으로 저장하고, 로그인된 상태를(ajax_isLogin) header가 알고있어야만
	// 로그인버튼이 사라지고 로그아웃버튼만 헤더에 남게됩니다.
	@RequestMapping(value = "/1")
	public String index(HttpServletRequest req, HttpServletResponse res, Master master) throws Exception {		
		return "redirect:/main1/index";    // 그냥 깡통페이지 --> return "main1/index" 로 코드 작성하게되면 로그인 했다는 정보를 master에 담았지만 header에 전달을 못하는 상황
	}
}