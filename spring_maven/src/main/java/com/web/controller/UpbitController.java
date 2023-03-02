package main.java.com.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.log4j.Logger;
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
import main.java.com.web.dto.upbit.UPBIT_MAIN;
import main.java.com.web.dto.upbit.UPBIT_MARKET;
import main.java.com.web.dto.upbit.UpCalResult;
import main.java.com.web.dto.upbit.UpOrders;
import main.java.com.web.dto.upbit.UpOrdersCallBack;
import main.java.com.web.dto.upbit.Upbit;
import main.java.com.web.dto.upbit.UpbitMarket;
import main.java.com.web.dto.upbit.UpbitMemory;
import main.java.com.web.dto.upbit.UpbitTicker;
import main.java.com.web.dto.upbit.UpbitUser;
import main.java.com.web.dto.upbit.UpbitUserAccount;
import main.java.com.web.service.AdminService;
import main.java.com.web.service.UpbitService;
import main.java.com.web.upbit.UpCmd;
import main.java.com.web.util.DateHelper;
import main.java.com.web.util.DevHelper;
import main.java.com.web.util.HwangHelper;
import main.java.com.web.util.ImgHelper;
import main.java.com.web.util.UpbitHelper;

@Controller
@RequestMapping("/upbit")
public class UpbitController {
	//private Logger logger = org.slf4j.Logger.getLogger(AdminController.class);

	@Resource(name = "upbitService")
	private UpbitService upbitService;
	
	@RequestMapping(value = "/")
	public String index(HttpServletRequest req, HttpServletResponse res, Upbit upbit) throws Exception {		
		DevHelper devHelper = new DevHelper();
		UpbitUser upbitUser = (UpbitUser)devHelper.getSession(req, "upbitUser");		
		for (UpbitUser _upbitUser : UpbitMemory.UpbitUsers) {
			if(upbitUser.getAccess_key().equals(_upbitUser.getAccess_key())) {
				upbitUser.setUpbitUserAccounts(_upbitUser.getUpbitUserAccounts());
			}
		}
		req.setAttribute("upbitUserJson", new Gson().toJson(upbitUser));
		req.setAttribute("upbitUser", upbitUser);
		req.setAttribute("upbitMarkets", UpbitMemory.UpbitMarkets);
		return "upbit/index";
	}		
	
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest req, HttpServletResponse res, Upbit upbit) throws Exception {				
		return "upbit/login";
	}	
	
	@RequestMapping(value = "/ajax_login", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	public @ResponseBody String ajax_login(HttpServletRequest req, HttpServletResponse res, Upbit upbit) throws Exception {
		try {
			// 아이디 비번 받아서 로그인 처리
			UpbitUser upbitUser = upbitService.select_user(upbit.getUpbitUser());
			if(upbitUser == null) {
				upbit.fail("xxxx", "등록된 정보가 없습니다.");
			}else {
				// 세션이 담는다.
				DevHelper devHelper = new DevHelper();
				devHelper.setSession(req, upbitUser, "upbitUser");
				upbit.success();
			}						
		} catch (Exception e) {
			upbit.fail("xxxx", e.toString());
		}
		
		return new Gson().toJson(upbit);
	}
	
	@RequestMapping(value = "/ajax_cronTab", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public @ResponseBody String ajax_cronTab(HttpServletRequest req, HttpServletResponse res, Upbit upbit) throws Exception {
		while (UpbitMemory.UpbitRunning) {
			Thread.sleep(100);
			try {
				//upbitService.run_upbit();
			} catch (Exception e) {								
				System.out.println(e.toString());
				UpbitMemory.UpbitRunning = true;
			}			
		}					
		return new Gson().toJson(upbit);
	}
}
