package main.java.com.web;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import main.java.com.web.dto.upbit.UpOrders;
import main.java.com.web.dto.upbit.UpOrdersCallBack;
import main.java.com.web.dto.upbit.UpbitMarket;
import main.java.com.web.dto.upbit.UpbitUser;
import main.java.com.web.upbit.UpCmd;

public class MainUpBit {

	public static void main(String[] args) throws IOException, InterruptedException, NoSuchAlgorithmException {
		//System.out.println((int)Double.parseDouble("44"));
		//UpCmd upCmd = new UpCmd();
		//UpbitUser upbitUser = new UpbitUser();
		//upbitUser.setAccess_key("ukZlJXXRdDK3uWBknpjLQIfsbeyEQPl7iyeHBaKn");
		//upbitUser.setSecret_key("jw0ALijK326vxRiy8xrh2o87NivQj0PE0hXm8zB6");
		//upCmd.GetAccounts(upbitUser);
		/*List<UpbitMarket> markets = upCmd.GetMarketAll();
		for (UpbitMarket market : markets) {
			if(market.getMarket().substring(0, 3).equals("KRW")) { // 한쿡 인거만
				Thread.sleep(100);
				System.out.println(new Gson().toJson(upCmd.GetTicket(market.getMarket())));
			}			
		}*/
		//upbitUser.setAccess_key("ukZlJXXRdDK3uWBknpjLQIfsbeyEQPl7iyeHBaKn");
		//upbitUser.setSecret_key("jw0ALijK326vxRiy8xrh2o87NivQj0PE0hXm8zB6");
		//System.out.println(new Gson().toJson(upCmd.GetAccounts(upbitUser)));
		
		//List<UpbitMarket> aaa = upCmd.GetMarketAll();
		//UpOrders upOrders = new UpOrders();
		//upOrders.setMarket("KRW-MLK");
		//upOrders.setOrd_type("limit"); //- limit : 지정가 주문 price : 시장가 주문(매수) market : 시장가 주문(매도)
		//upOrders.setPrice("100");
		//upOrders.setSide("bid"); // bid : 매수 ask : 매도 
		//upOrders.setVolume("100");
		
		//upOrders.setUuid("d0423cb9-3b16-4653-8f3b-b710b079460d");
		//System.out.println(new Gson().toJson(upCmd.PostOrdersCancel(upbitUser, upOrders)));
		//upOrders.setMarket("KRW-MLK");
		//upOrders.setOrd_type("limit"); //- limit : 지정가 주문 price : 시장가 주문(매수) market : 시장가 주문(매도)
		//upOrders.setPrice("1000");
		//upOrders.setSide("ask"); // bid : 매수 ask : 매도 
		//upOrders.setVolume("20"); // 판매 수량
		
		//UpOrdersCallBack upOrdersCallBack = upCmd.PostOrders(upbitUser, upOrders);
		//System.out.println(new Gson().toJson(upOrdersCallBack));
		
		// 주문 대기 조회
		//List<String> uuids = new ArrayList<String>();
		//uuids.add("8272afee-9d12-4be4-b9ea-d02d64cfcd40");
		//uuids.add("aebcecfc-1ae0-47e3-9f37-f40b91adb15b");
		
		//upOrders.setState("wait");
		//upOrders.setUuids(uuids);
		//List<UpOrdersCallBack> upOrdersCallBacks = upCmd.PostOrdersStatus(upbitUser, upOrders);
		//for (UpOrdersCallBack u : upOrdersCallBacks) {
		//	System.out.println(new Gson().toJson(u));
		//}
		// 대기 취소 error 없으면 접수 된거임
		//upOrders.setUuid("45c63d71-15d4-4c67-9d1e-bf50af856074");
		//UpOrdersCallBack upOrdersCallBack = upCmd.PostOrdersCancel(upbitUser, upOrders);
		//System.out.println(new Gson().toJson(upOrdersCallBack));
		// d0423cb9-3b16-4653-8f3b-b710b079460d
		//System.out.print(1%10);
	}
}
