package main.java.com.web.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import main.java.com.web.dao.AdminDao;
import main.java.com.web.dao.UpbitDao;
import main.java.com.web.dto.Admin;
import main.java.com.web.dto.AdminNotice;
import main.java.com.web.dto.Files;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.MainJust;
import main.java.com.web.dto.upbit.UPBIT_MAIN;
import main.java.com.web.dto.upbit.UPBIT_MARKET;
import main.java.com.web.dto.upbit.UPBIT_RATELOG;
import main.java.com.web.dto.upbit.UpCalResult;
import main.java.com.web.dto.upbit.UpOrders;
import main.java.com.web.dto.upbit.UpOrdersCallBack;
import main.java.com.web.dto.upbit.UpbitMarket;
import main.java.com.web.dto.upbit.UpbitMemory;
import main.java.com.web.dto.upbit.UpbitTicker;
import main.java.com.web.dto.upbit.UpbitUser;
import main.java.com.web.dto.upbit.UpbitUserAccount;
import main.java.com.web.service.AdminService;
import main.java.com.web.service.UpbitService;
import main.java.com.web.upbit.UpCmd;
import main.java.com.web.util.DateHelper;
import main.java.com.web.util.UpbitHelper;

@Service("upbitService")
public class UpbitServiceImpl implements UpbitService{

	@Resource(name="UpbitDao")
	private UpbitDao upbitDao;

	@Override
	public UpbitUser select_user(UpbitUser upbitUser) {		
		return upbitDao.select_user(upbitUser);
	}

	@Override
	public List<UpbitUser> select_users(UpbitUser upbitUser) {
		return upbitDao.select_users(upbitUser);
	}

	@Override
	public void delete_market_all() {
		upbitDao.delete_market_all();
	}

	@Override
	public void insert_market(UpCalResult upCalResult) {
		upbitDao.insert_market(upCalResult);
	}

	@Override
	public void update_market(UpCalResult c) {
		upbitDao.update_market(c);
	}

	@Override
	public void delete_market_main_all() {
		upbitDao.delete_market_main_all();
		
	}

	@Override
	public void insert_market_main(UpbitMarket upbitMarket) {
		upbitDao.insert_market_main(upbitMarket);
	}

	@Override
	public void update_market_main(UpCalResult c) {
		c.setRaiseRate(Double.parseDouble(String.format("%.5f", c.getRaiseRate())));
		upbitDao.update_market_main(c);
	}

	@Override
	public void update_market_main_win() {
		upbitDao.update_market_main_win();
	}

	@Override
	public void update_market_main_start_price(UpbitTicker t) {
		upbitDao.update_market_main_start_price(t);
	}

	@Override
	public List<UPBIT_MAIN> select_upbit_main_win(int i) {
		return upbitDao.select_upbit_main_win(i);
	}

	@Override
	public List<UPBIT_MARKET> select_upbit_market_top(UPBIT_MAIN m) {
		return upbitDao.select_upbit_market_top(m);
	}

	@Override
	public void insert_upOrders(UpOrdersCallBack upOrdersCallBack) {
		upbitDao.insert_upOrders(upOrdersCallBack);
	}

	@Override
	public List<UpOrdersCallBack> select_order_print(UpbitUser u) {
		return upbitDao.select_order_print(u);
	}

	@Override
	public void update_order(UpOrdersCallBack callback) {
		upbitDao.update_order(callback);
	}

	@Override
	public void update_buyed(UpOrdersCallBack upOrdersCallBack) {
		upbitDao.update_buyed(upOrdersCallBack);
	}

	@Override
	public String select_avg(String market) {
		return upbitDao.select_avg(market);
	}

	@Override
	public void delete_bid_done_remove(String market) {
		upbitDao.delete_bid_done_remove(market);
	}

	public UPBIT_MAIN select_best_down_win_one() {
		return upbitDao.select_best_down_win_one();
	}
	
	private void insert_ratelog(UPBIT_RATELOG upbit_ratelog) {
		upbitDao.insert_ratelog(upbit_ratelog);
	}
	/*
	@Override
	public void run_upbit() throws Exception {
		// #################### START 전역변수 초기화 START #################### // 	
		UpCmd upCmd = new UpCmd();
		UpOrders upOrders = new UpOrders();
		int currency_unit = 100000; // 구매 한도						
		int worst_win_upbit_main_one_limit = -500; // 매수 시점 하락률 5%
		int limit_minus_rate = -4; // 마이너스 수익률 일때 물타기 -5%
		// #################### END 전역변수 초기화 END #################### // 	
		
		// #################### START 1회성 마켓정보 START #################### // 	
		if(UpbitMemory.UpbitStartCalNum == 0) {			
			UpbitMemory.UpbitUsers.clear();
			UpbitMemory.UpbitMarkets.clear();
			UpbitMemory.UpbitTickers.clear();
			UpbitMemory.UpbitTickersFirst.clear();
			UpbitMemory.UpbitMarkets = upCmd.GetMarketAll();
			this.delete_market_all(); // 모든 마켓 ROW 삭제
			this.delete_market_main_all(); // 분석 메인 삭제
			for (UpbitMarket upbitMarket : UpbitMemory.UpbitMarkets) {
				if(upbitMarket.getMarket().substring(0, 3).equals("KRW")) { // 한국원화 코인만
					this.insert_market_main(upbitMarket);
				}
			}
		}
		// #################### END 1회성 마켓정보 END #################### // 	
				
		// #################### START 사용자 설정 START #################### // 		
		UpbitUser UpbitUser = new UpbitUser();
		UpbitUser.setStatus_code("Y");
		UpbitUser.setRun_code("Y");
		List<UpbitUser> upbitUsers = this.select_users(UpbitUser);
				
		for (UpbitUser user : upbitUsers) {						
			user.setUpbitUserAccounts(upCmd.GetAccounts(user));
			for (UpbitUserAccount upbitUserAccount : user.getUpbitUserAccounts()) {
				upbitUserAccount.setMarket(upbitUserAccount.getUnit_currency()+"-"+upbitUserAccount.getCurrency());
			}
		}
		UpbitMemory.UpbitUsers.clear();
		UpbitMemory.UpbitUsers = upbitUsers;
		// #################### END 사용자 설정 END #################### //
		
		// #################### START 실시간 코인 정보 START #################### //
		List<UpbitTicker> _UpbitTickers = new ArrayList<UpbitTicker>();
		for (UpbitMarket upbitMarket : UpbitMemory.UpbitMarkets) {
			if(upbitMarket.getMarket().substring(0, 3).equals("KRW")) { // 한국원화 코인만
				Thread.sleep(100);
				List<UpbitTicker> upbitTickers = upCmd.GetTicket(upbitMarket.getMarket());
									
				UpbitTicker t = upbitTickers.get(0);
				t.setKorean_name(upbitMarket.getKorean_name());
				_UpbitTickers.add(t);	
				if(UpbitMemory.UpbitStartCalNum == 0) this.update_market_main_start_price(t); // 최초에만 거래가 업데이트
			}		
		}								
		UpbitMemory.UpbitTickers.clear();
		UpbitMemory.UpbitTickers = _UpbitTickers;
		// #################### END 실시간 코인 정보 END #################### //
		
		// #################### START 매수/매도 모니터링 START #################### //
		List<UpOrdersCallBack> callBacks = null;
		for (UpbitUser user : UpbitMemory.UpbitUsers) {			
			List<UpOrdersCallBack> upOrdersCallBacks = this.select_order_print(user); // 대기중인 매수/매도 건만
			for (UpOrdersCallBack uTicker : upOrdersCallBacks) {
				upOrders = new UpOrders();
				List<String> uuids = new ArrayList<String>();
				uuids.add(uTicker.getUuid());												
				String statusNm = ""; 
						
				// local wait && upbit done 				
				upOrders.setUuids(uuids);
				upOrders.setState("done");				
				callBacks = upCmd.PostOrdersStatus(user, upOrders);
				for (UpOrdersCallBack callback : callBacks) {
					if(callback.getSide().equals("bid")) statusNm = "매수예약=>매수완료";
					else statusNm = "매도예약=>매도완료";
					System.out.println("["+callback.getMarket()+"]["+statusNm+"]");
					this.update_order(callback);					
				}
				
				// local wait && upbit wait : 체결이 안된상태면 취소 
				upOrders = new UpOrders();
				upOrders.setUuids(uuids);
				upOrders.setState("wait");				
				callBacks = upCmd.PostOrdersStatus(user, upOrders);
								
				for (UpOrdersCallBack callback : callBacks) {				
					// call cancel post
					UpOrders upOrdersCancel = new UpOrders();
					upOrdersCancel.setUuid(callback.getUuid());
					UpOrdersCallBack upOrdersCallBack = upCmd.PostOrdersCancel(user, upOrdersCancel);
					if(upOrdersCallBack.getError() != null) {						
						System.out.println("["+callback.getMarket()+"]["+upOrdersCallBack.getError().getMessage()+"]["+upOrdersCallBack.getError().getName()+"]");
					}else {
						if(callback.getSide().equals("bid")) statusNm = "매수예약=>매수취소";
						else statusNm = "매도예약=>매도취소";
						System.out.println("["+callback.getMarket()+"]["+statusNm+"]");
						this.update_order(upOrdersCallBack);														
					}										
				}
				
				// local wait && upbit cancel : 취소 상태는 취소로 변경
				upOrders = new UpOrders();
				upOrders.setUuids(uuids);
				upOrders.setState("cancel");				
				callBacks = upCmd.PostOrdersStatus(user, upOrders);
				for (UpOrdersCallBack callback : callBacks) {					
					this.update_order(callback);					
				}
			}
		}
		// #################### END 매수/매도 모니터링 END #################### //
				
		// #################### START 분석 모니터링 START #################### //
		List<UpCalResult> upCalResults = new ArrayList<UpCalResult>();
		for (UpbitTicker t1 : UpbitMemory.UpbitTickersFirst) {
			int trade_price_1 = (int)t1.getTrade_price();
			int trade_price_10 = 0;
			for (UpbitTicker t10 : UpbitMemory.UpbitTickers) {
				if(t1.getMarket().equals(t10.getMarket())) {
					trade_price_10 = (int)t10.getTrade_price();
				}
			}
			
			// 정상적으로 값이 들어 왔을 경우
			if(trade_price_1 != 0 && trade_price_10 != 0) {
				int raisePrice = trade_price_10 - trade_price_1;
				double raiseRate = (double)raisePrice/trade_price_1 * 100;
											
				UpCalResult c = new UpCalResult();
				c.setKorean_name(t1.getKorean_name());
				c.setMarket(t1.getMarket());
				c.setRaisePrice(raisePrice);
				c.setTrade_price_1(trade_price_1);
				c.setTrade_price_10(trade_price_10);
				c.setRaiseRate(Double.parseDouble(String.format("%.5f", raiseRate)));
				upCalResults.add(c);
			}
		}
				
		// 현재 데이터를 과거 비교 데이터로 입력
		UpbitMemory.UpbitTickersFirst.clear();
		for (UpbitTicker t : UpbitMemory.UpbitTickers) {
			UpbitMemory.UpbitTickersFirst.add(t);
		}
		// #################### END 분석 모니터링 END #################### //
				
		// #################### START 분석 저장 START #################### //		
		for (UpCalResult upCalResult : upCalResults) {						
			// 변동이 있는 경우만 저장					
			if(upCalResult.getRaisePrice() != 0 && (upCalResult.getTrade_price_10() > 100 && upCalResult.getTrade_price_10() < currency_unit)) {						
				upCalResult.setCal_cnt(UpbitMemory.UpbitStartCalNum);
				this.insert_market(upCalResult); // 주기적 정보 저장
				this.update_market_main(upCalResult); // 결과값 분석 저장
			}
		}
		this.update_market_main_win(); // 분석 정렬 필터 없데이트
		// #################### END 분석 저장 END #################### //
		
		// #################### START 최고 하락 마켓 START #################### //
		UPBIT_MAIN worst_win_upbit_main_one = this.select_best_down_win_one();
		UPBIT_RATELOG upbit_ratelog = new UPBIT_RATELOG();
		upbit_ratelog.setMarket(worst_win_upbit_main_one.getMarket());
		upbit_ratelog.setWin(worst_win_upbit_main_one.getWin());
		upbit_ratelog.setYmd(new DateHelper().yyyymmdd());
		upbit_ratelog.setCalnum(UpbitMemory.UpbitStartCalNum);
		this.insert_ratelog(upbit_ratelog);
		System.out.println("############### ["+UpbitMemory.UpbitStartCalNum+"회차]["+worst_win_upbit_main_one.getMarket()+"]["+worst_win_upbit_main_one.getWin()+"] ###############");
		
		// #################### END 최고 하락 마켓 END #################### //
		
		// #################### START 매수 진행 START #################### //
		for (UpbitUser upbitUser : UpbitMemory.UpbitUsers) {
			for (UpbitUserAccount upbitUserAccount : upbitUser.getUpbitUserAccounts()) {
				if(upbitUserAccount.getMarket().equals("KRW-KRW")) { // 원화 금액으로만 구매 가능					
					int iBalance = (int)Double.parseDouble(upbitUserAccount.getBalance());										
					if(iBalance > currency_unit) {			
						
						String worst_market = worst_win_upbit_main_one.getMarket();
						// 하락율 기준 이상으로 떨어진 마켓이 있으면 매수
						if(worst_win_upbit_main_one_limit > worst_win_upbit_main_one.getWin()) {
							// 평균 구매가(내 계좌에 있는 마켓이면)
							int avg = 0;
							for (UpbitUserAccount mycount : upbitUser.getUpbitUserAccounts()) {
								if(mycount.getMarket().equals(worst_win_upbit_main_one.getMarket())) {
									// 평균 구매가(upbit에 있는 평균 구매가)
									avg = (int)Double.parseDouble(mycount.getAvg_buy_price());
								}
							}
							
							// 구매 내역이 없으므로 최종 확인된 하락 금액으로 설정
							if(avg == 0) { 
								avg = worst_win_upbit_main_one.getTrade_price();										
							}
							
							// 현재 시점으로 조회 하여 구매
							List<UpbitTicker> upbitTickers = upCmd.GetTicket(worst_win_upbit_main_one.getMarket());
							UpbitTicker t = upbitTickers.get(0);
																
							int upbit_price = (int)t.getTrade_price();
							String price = String.valueOf(upbit_price);
							String volume = String.valueOf(currency_unit/upbit_price);
							
							// 현재 평균 구매가보다 작을 경우만 구매 하자
							System.out.println("["+worst_win_upbit_main_one.getMarket()+"][금액비교]["+avg+"]["+upbit_price+"]");
							if(avg > upbit_price) {
								// 매수 파라미터   	
								upOrders = new UpOrders();
								upOrders.setMarket(t.getMarket());
								upOrders.setOrd_type("limit");
								upOrders.setPrice(price);
								upOrders.setSide("bid"); 
								upOrders.setVolume(volume);
								
								// 매수 Upbit 요청
								UpOrdersCallBack upOrdersCallBack = upCmd.PostOrders(upbitUser, upOrders);
								if(upOrdersCallBack.getError() != null) {
									System.out.println("["+t.getMarket()+"][매수요청실패]["+upOrdersCallBack.getError().getMessage()+"]["+upOrdersCallBack.getError().getName()+"]");
								}else {																					
									System.out.println("["+t.getMarket()+"]["+price+"]["+upOrdersCallBack.getState()+"][매수요청성공]");
									upOrdersCallBack.setBuyed_price(upbit_price);
									upOrdersCallBack.setBuyed_total(upbit_price*(currency_unit/upbit_price));
									upOrdersCallBack.setSaled_price(0);
									upOrdersCallBack.setSaled_total(0);
									upOrdersCallBack.setSecret_key(upbitUser.getSecret_key());
									upOrdersCallBack.setAccess_key(upbitUser.getAccess_key());
									upOrdersCallBack.setName(upbitUser.getName());
									this.insert_upOrders(upOrdersCallBack);																			
									iBalance = iBalance - upbit_price*(currency_unit/upbit_price);
									
									// 매수 후 다시 초기화 하여 재실행 
									UpbitMemory.Reset = true;									
								}
							}else {
								System.out.println("["+t.getMarket()+"][구매가:"+avg+"][업비트가:"+upbit_price+"][구매X]");
							}
							
						}
						
						// 물타기 5%이상 차이가 나면[하락율 기준 이상으로 떨어진 마켓이 있으면 매수건이 없으면]
						if(!UpbitMemory.Reset) {
							for (UpbitUserAccount mycount : upbitUser.getUpbitUserAccounts()) {
								String my_market = mycount.getMarket();
								if(iBalance > currency_unit) {	
									if(!worst_market.equals(my_market)) {
										if(!my_market.equals("KRW-KRW")) { // 일반 코인일때 해당 코인의 현재가와 비교하여 9%	
											Thread.sleep(100);
											// 현재 시점으로 조회 하여 구매
											List<UpbitTicker> upbitTickers = upCmd.GetTicket(my_market);
											UpbitTicker t = upbitTickers.get(0);
																				
											int upbit_price = (int)t.getTrade_price(); // upbit 가격
											int my_price = (int)Double.parseDouble(mycount.getAvg_buy_price());
											int interval = upbit_price - my_price; // 거래가 - 매수가
											int rate = (interval*100)/my_price; // 수익률 %
											String price = String.valueOf(upbit_price);
											String volume = String.valueOf(currency_unit/upbit_price);
											
											//System.out.println("["+my_market+"][구매가:"+my_price+"][업비트가:"+upbit_price+"][수익률:"+rate+"]");
											if(rate < limit_minus_rate) { // 마이너스 수익률이면 물타자
												// 매수 파라미터   	
												upOrders = new UpOrders();
												upOrders.setMarket(my_market);
												upOrders.setOrd_type("limit");
												upOrders.setPrice(price);
												upOrders.setSide("bid"); 
												upOrders.setVolume(volume);
												
												// 매수 Upbit 요청
												UpOrdersCallBack upOrdersCallBack = upCmd.PostOrders(upbitUser, upOrders);
												if(upOrdersCallBack.getError() != null) {
													System.out.println("["+t.getMarket()+"][매수요청실패]["+upOrdersCallBack.getError().getMessage()+"]["+upOrdersCallBack.getError().getName()+"]");
												}else {																					
													System.out.println("["+t.getMarket()+"]["+price+"]["+upOrdersCallBack.getState()+"][매수요청성공]");
													upOrdersCallBack.setBuyed_price(upbit_price);
													upOrdersCallBack.setBuyed_total(upbit_price*(currency_unit/upbit_price));
													upOrdersCallBack.setSaled_price(0);
													upOrdersCallBack.setSaled_total(0);
													upOrdersCallBack.setSecret_key(upbitUser.getSecret_key());
													upOrdersCallBack.setAccess_key(upbitUser.getAccess_key());
													upOrdersCallBack.setName(upbitUser.getName());
													this.insert_upOrders(upOrdersCallBack);																							
													iBalance = iBalance - upbit_price*(currency_unit/upbit_price);								
												}
											}
										}
									}									
								}
							}
							
						}
					}else {
						System.out.println("[금액부족......]");
					}
				}
			}
		}
		// #################### END 매수 진행 END #################### //
						
		// #################### START 매도 진행 START #################### //		
		for (UpbitUser upbitUser : UpbitMemory.UpbitUsers) {
			for (UpbitUserAccount upbitUserAccount : upbitUser.getUpbitUserAccounts()) {
				if(!upbitUserAccount.getMarket().equals("KRW-KRW")) {						
					Thread.sleep(100);
					
					// 평균 구매가 							
					String sAvg = upbitUserAccount.getAvg_buy_price();															
					int avg = (int)Double.parseDouble(sAvg); // 매수 평균가
					int insAvg = avg + (int)(avg*0.01);					
										
					//System.out.println("["+upbitUserAccount.getMarket()+"][up_my_price "+ (int)Double.parseDouble(sAvg)+"]");								
					
					// 현재 시점으로 조회 하여 판매					
					List<UpbitTicker> upbitTickers = upCmd.GetTicket(upbitUserAccount.getMarket());
					UpbitTicker t = upbitTickers.get(0);					
					
					String volume = upbitUserAccount.getBalance();
					int upbit_price = (int)t.getTrade_price();
					String price = String.valueOf(upbit_price);						
					int bitAvg = upbit_price;						
					int total_local = insAvg * (int)Double.parseDouble(volume);
					int total_upbit = bitAvg * (int)Double.parseDouble(volume);
					int good_money = total_upbit - total_local;
					
					if(insAvg < bitAvg) {	
						// 매도 파라미터		
						upOrders = new UpOrders();
						upOrders.setMarket(upbitUserAccount.getMarket());
						upOrders.setOrd_type("limit");
						upOrders.setPrice(price);
						upOrders.setSide("ask"); 
						upOrders.setVolume(volume);
						
						// 매도 Upbit 요청(매도 진행 중건은 제외)		
						if((int)Double.parseDouble(volume) != 0) {
							UpOrdersCallBack upOrdersCallBack = upCmd.PostOrders(upbitUser, upOrders);							
							if(upOrdersCallBack.getError() != null) {							
								System.out.println("["+upbitUserAccount.getMarket()+"]["+price+"]["+volume+"][매도요청실패]["+upOrdersCallBack.getError().getMessage()+"]["+upOrdersCallBack.getError().getName()+"]");
							}else {
								System.out.println("["+upbitUserAccount.getMarket()+"]["+good_money+"]["+upOrdersCallBack.getState()+"][매도요청성공]");
								
								// 매도 Upbit 요청 저장
								upOrdersCallBack.setBuyed_price(0);
								upOrdersCallBack.setBuyed_total(0);
								upOrdersCallBack.setSaled_price(upbit_price);
								upOrdersCallBack.setSaled_total(upbit_price * (int)Double.parseDouble(upbitUserAccount.getBalance()));
								upOrdersCallBack.setSecret_key(upbitUser.getSecret_key());
								upOrdersCallBack.setAccess_key(upbitUser.getAccess_key());
								upOrdersCallBack.setName(upbitUser.getName());
								this.insert_upOrders(upOrdersCallBack);							
							}
						}						
					}else {
						//System.out.println("["+upbitUserAccount.getMarket()+"]["+insAvg+"]["+bitAvg+"]["+good_money+"][매도 불충분]");
					}														
				}
			}
		}				
		// #################### END 매도 진행 END #################### //
		
		// 매수 했거나 200회 넘으면
		UpbitMemory.UpbitStartCalNum ++;
		if(UpbitMemory.Reset) {
			UpbitMemory.UpbitStartCalNum = 0;
			UpbitMemory.Reset = false;
		}else if(UpbitMemory.UpbitStartCalNum == 200) {
			UpbitMemory.UpbitStartCalNum = 0;
			UpbitMemory.Reset = false;
		}		
	}*/	
}
