package main.java.com.web.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

import main.java.com.web.dto.upbit.UPBIT_MAIN;
import main.java.com.web.dto.upbit.UPBIT_MARKET;
import main.java.com.web.dto.upbit.UpCalResult;
import main.java.com.web.dto.upbit.UpOrders;
import main.java.com.web.dto.upbit.UpOrdersCallBack;
import main.java.com.web.dto.upbit.UpbitMarket;
import main.java.com.web.dto.upbit.UpbitMemory;
import main.java.com.web.dto.upbit.UpbitTicker;
import main.java.com.web.dto.upbit.UpbitUser;
import main.java.com.web.dto.upbit.UpbitUserAccount;
import main.java.com.web.service.UpbitService;
import main.java.com.web.upbit.UpCmd;
@Component
public class Task {		
	@Resource(name = "upbitService")
	private UpbitService upbitService;
	
	@Scheduled(fixedDelay = 100, initialDelay = 0)
	public void upbitMarket() throws IOException {		
		try {
			//if(UpbitMemory.UpbitRunning) {
			//	UpbitMemory.UpbitRunning = false;
			//	upbitService.run_upbit();
			//	UpbitMemory.UpbitRunning = true;
			//} 
		} catch (Exception e) {
			UpbitMemory.UpbitRunning = true;
			System.out.println("upbitMarket : "+e.toString());
		}					
	} 
}
