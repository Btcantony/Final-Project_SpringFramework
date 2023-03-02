package main.java.com.web.service;

import java.util.List;

import main.java.com.web.dto.Admin;
import main.java.com.web.dto.AdminNotice;
import main.java.com.web.dto.Files;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.MainJust;
import main.java.com.web.dto.upbit.UPBIT_MAIN;
import main.java.com.web.dto.upbit.UPBIT_MARKET;
import main.java.com.web.dto.upbit.UpCalResult;
import main.java.com.web.dto.upbit.UpOrdersCallBack;
import main.java.com.web.dto.upbit.UpbitMarket;
import main.java.com.web.dto.upbit.UpbitTicker;
import main.java.com.web.dto.upbit.UpbitUser;

public interface UpbitService {
	// 사용자 계정 검색
	UpbitUser select_user(UpbitUser upbitUser);

	// 사용자 계정들 검색
	List<UpbitUser> select_users(UpbitUser upbitUser);

	void delete_market_all();

	void insert_market(UpCalResult c);

	void update_market(UpCalResult c);

	void delete_market_main_all();

	void insert_market_main(UpbitMarket upbitMarket);

	void update_market_main(UpCalResult c);

	void update_market_main_win();

	void update_market_main_start_price(UpbitTicker t);

	List<UPBIT_MAIN> select_upbit_main_win(int i);

	List<UPBIT_MARKET> select_upbit_market_top(UPBIT_MAIN m);

	void insert_upOrders(UpOrdersCallBack upOrdersCallBack);

	List<UpOrdersCallBack> select_order_print(UpbitUser u);

	void update_order(UpOrdersCallBack callback);

	void update_buyed(UpOrdersCallBack upOrdersCallBack);

	String select_avg(String market);

	void delete_bid_done_remove(String market);

	//void run_upbit() throws Exception;	
}
