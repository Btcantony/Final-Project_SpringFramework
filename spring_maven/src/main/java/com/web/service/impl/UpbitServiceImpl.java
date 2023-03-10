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
		// #################### START ???????????? ????????? START #################### // 	
		UpCmd upCmd = new UpCmd();
		UpOrders upOrders = new UpOrders();
		int currency_unit = 100000; // ?????? ??????						
		int worst_win_upbit_main_one_limit = -500; // ?????? ?????? ????????? 5%
		int limit_minus_rate = -4; // ???????????? ????????? ?????? ????????? -5%
		// #################### END ???????????? ????????? END #################### // 	
		
		// #################### START 1?????? ???????????? START #################### // 	
		if(UpbitMemory.UpbitStartCalNum == 0) {			
			UpbitMemory.UpbitUsers.clear();
			UpbitMemory.UpbitMarkets.clear();
			UpbitMemory.UpbitTickers.clear();
			UpbitMemory.UpbitTickersFirst.clear();
			UpbitMemory.UpbitMarkets = upCmd.GetMarketAll();
			this.delete_market_all(); // ?????? ?????? ROW ??????
			this.delete_market_main_all(); // ?????? ?????? ??????
			for (UpbitMarket upbitMarket : UpbitMemory.UpbitMarkets) {
				if(upbitMarket.getMarket().substring(0, 3).equals("KRW")) { // ???????????? ?????????
					this.insert_market_main(upbitMarket);
				}
			}
		}
		// #################### END 1?????? ???????????? END #################### // 	
				
		// #################### START ????????? ?????? START #################### // 		
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
		// #################### END ????????? ?????? END #################### //
		
		// #################### START ????????? ?????? ?????? START #################### //
		List<UpbitTicker> _UpbitTickers = new ArrayList<UpbitTicker>();
		for (UpbitMarket upbitMarket : UpbitMemory.UpbitMarkets) {
			if(upbitMarket.getMarket().substring(0, 3).equals("KRW")) { // ???????????? ?????????
				Thread.sleep(100);
				List<UpbitTicker> upbitTickers = upCmd.GetTicket(upbitMarket.getMarket());
									
				UpbitTicker t = upbitTickers.get(0);
				t.setKorean_name(upbitMarket.getKorean_name());
				_UpbitTickers.add(t);	
				if(UpbitMemory.UpbitStartCalNum == 0) this.update_market_main_start_price(t); // ???????????? ????????? ????????????
			}		
		}								
		UpbitMemory.UpbitTickers.clear();
		UpbitMemory.UpbitTickers = _UpbitTickers;
		// #################### END ????????? ?????? ?????? END #################### //
		
		// #################### START ??????/?????? ???????????? START #################### //
		List<UpOrdersCallBack> callBacks = null;
		for (UpbitUser user : UpbitMemory.UpbitUsers) {			
			List<UpOrdersCallBack> upOrdersCallBacks = this.select_order_print(user); // ???????????? ??????/?????? ??????
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
					if(callback.getSide().equals("bid")) statusNm = "????????????=>????????????";
					else statusNm = "????????????=>????????????";
					System.out.println("["+callback.getMarket()+"]["+statusNm+"]");
					this.update_order(callback);					
				}
				
				// local wait && upbit wait : ????????? ??????????????? ?????? 
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
						if(callback.getSide().equals("bid")) statusNm = "????????????=>????????????";
						else statusNm = "????????????=>????????????";
						System.out.println("["+callback.getMarket()+"]["+statusNm+"]");
						this.update_order(upOrdersCallBack);														
					}										
				}
				
				// local wait && upbit cancel : ?????? ????????? ????????? ??????
				upOrders = new UpOrders();
				upOrders.setUuids(uuids);
				upOrders.setState("cancel");				
				callBacks = upCmd.PostOrdersStatus(user, upOrders);
				for (UpOrdersCallBack callback : callBacks) {					
					this.update_order(callback);					
				}
			}
		}
		// #################### END ??????/?????? ???????????? END #################### //
				
		// #################### START ?????? ???????????? START #################### //
		List<UpCalResult> upCalResults = new ArrayList<UpCalResult>();
		for (UpbitTicker t1 : UpbitMemory.UpbitTickersFirst) {
			int trade_price_1 = (int)t1.getTrade_price();
			int trade_price_10 = 0;
			for (UpbitTicker t10 : UpbitMemory.UpbitTickers) {
				if(t1.getMarket().equals(t10.getMarket())) {
					trade_price_10 = (int)t10.getTrade_price();
				}
			}
			
			// ??????????????? ?????? ?????? ?????? ??????
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
				
		// ?????? ???????????? ?????? ?????? ???????????? ??????
		UpbitMemory.UpbitTickersFirst.clear();
		for (UpbitTicker t : UpbitMemory.UpbitTickers) {
			UpbitMemory.UpbitTickersFirst.add(t);
		}
		// #################### END ?????? ???????????? END #################### //
				
		// #################### START ?????? ?????? START #################### //		
		for (UpCalResult upCalResult : upCalResults) {						
			// ????????? ?????? ????????? ??????					
			if(upCalResult.getRaisePrice() != 0 && (upCalResult.getTrade_price_10() > 100 && upCalResult.getTrade_price_10() < currency_unit)) {						
				upCalResult.setCal_cnt(UpbitMemory.UpbitStartCalNum);
				this.insert_market(upCalResult); // ????????? ?????? ??????
				this.update_market_main(upCalResult); // ????????? ?????? ??????
			}
		}
		this.update_market_main_win(); // ?????? ?????? ?????? ????????????
		// #################### END ?????? ?????? END #################### //
		
		// #################### START ?????? ?????? ?????? START #################### //
		UPBIT_MAIN worst_win_upbit_main_one = this.select_best_down_win_one();
		UPBIT_RATELOG upbit_ratelog = new UPBIT_RATELOG();
		upbit_ratelog.setMarket(worst_win_upbit_main_one.getMarket());
		upbit_ratelog.setWin(worst_win_upbit_main_one.getWin());
		upbit_ratelog.setYmd(new DateHelper().yyyymmdd());
		upbit_ratelog.setCalnum(UpbitMemory.UpbitStartCalNum);
		this.insert_ratelog(upbit_ratelog);
		System.out.println("############### ["+UpbitMemory.UpbitStartCalNum+"??????]["+worst_win_upbit_main_one.getMarket()+"]["+worst_win_upbit_main_one.getWin()+"] ###############");
		
		// #################### END ?????? ?????? ?????? END #################### //
		
		// #################### START ?????? ?????? START #################### //
		for (UpbitUser upbitUser : UpbitMemory.UpbitUsers) {
			for (UpbitUserAccount upbitUserAccount : upbitUser.getUpbitUserAccounts()) {
				if(upbitUserAccount.getMarket().equals("KRW-KRW")) { // ?????? ??????????????? ?????? ??????					
					int iBalance = (int)Double.parseDouble(upbitUserAccount.getBalance());										
					if(iBalance > currency_unit) {			
						
						String worst_market = worst_win_upbit_main_one.getMarket();
						// ????????? ?????? ???????????? ????????? ????????? ????????? ??????
						if(worst_win_upbit_main_one_limit > worst_win_upbit_main_one.getWin()) {
							// ?????? ?????????(??? ????????? ?????? ????????????)
							int avg = 0;
							for (UpbitUserAccount mycount : upbitUser.getUpbitUserAccounts()) {
								if(mycount.getMarket().equals(worst_win_upbit_main_one.getMarket())) {
									// ?????? ?????????(upbit??? ?????? ?????? ?????????)
									avg = (int)Double.parseDouble(mycount.getAvg_buy_price());
								}
							}
							
							// ?????? ????????? ???????????? ?????? ????????? ?????? ???????????? ??????
							if(avg == 0) { 
								avg = worst_win_upbit_main_one.getTrade_price();										
							}
							
							// ?????? ???????????? ?????? ?????? ??????
							List<UpbitTicker> upbitTickers = upCmd.GetTicket(worst_win_upbit_main_one.getMarket());
							UpbitTicker t = upbitTickers.get(0);
																
							int upbit_price = (int)t.getTrade_price();
							String price = String.valueOf(upbit_price);
							String volume = String.valueOf(currency_unit/upbit_price);
							
							// ?????? ?????? ??????????????? ?????? ????????? ?????? ??????
							System.out.println("["+worst_win_upbit_main_one.getMarket()+"][????????????]["+avg+"]["+upbit_price+"]");
							if(avg > upbit_price) {
								// ?????? ????????????   	
								upOrders = new UpOrders();
								upOrders.setMarket(t.getMarket());
								upOrders.setOrd_type("limit");
								upOrders.setPrice(price);
								upOrders.setSide("bid"); 
								upOrders.setVolume(volume);
								
								// ?????? Upbit ??????
								UpOrdersCallBack upOrdersCallBack = upCmd.PostOrders(upbitUser, upOrders);
								if(upOrdersCallBack.getError() != null) {
									System.out.println("["+t.getMarket()+"][??????????????????]["+upOrdersCallBack.getError().getMessage()+"]["+upOrdersCallBack.getError().getName()+"]");
								}else {																					
									System.out.println("["+t.getMarket()+"]["+price+"]["+upOrdersCallBack.getState()+"][??????????????????]");
									upOrdersCallBack.setBuyed_price(upbit_price);
									upOrdersCallBack.setBuyed_total(upbit_price*(currency_unit/upbit_price));
									upOrdersCallBack.setSaled_price(0);
									upOrdersCallBack.setSaled_total(0);
									upOrdersCallBack.setSecret_key(upbitUser.getSecret_key());
									upOrdersCallBack.setAccess_key(upbitUser.getAccess_key());
									upOrdersCallBack.setName(upbitUser.getName());
									this.insert_upOrders(upOrdersCallBack);																			
									iBalance = iBalance - upbit_price*(currency_unit/upbit_price);
									
									// ?????? ??? ?????? ????????? ?????? ????????? 
									UpbitMemory.Reset = true;									
								}
							}else {
								System.out.println("["+t.getMarket()+"][?????????:"+avg+"][????????????:"+upbit_price+"][??????X]");
							}
							
						}
						
						// ????????? 5%?????? ????????? ??????[????????? ?????? ???????????? ????????? ????????? ????????? ???????????? ?????????]
						if(!UpbitMemory.Reset) {
							for (UpbitUserAccount mycount : upbitUser.getUpbitUserAccounts()) {
								String my_market = mycount.getMarket();
								if(iBalance > currency_unit) {	
									if(!worst_market.equals(my_market)) {
										if(!my_market.equals("KRW-KRW")) { // ?????? ???????????? ?????? ????????? ???????????? ???????????? 9%	
											Thread.sleep(100);
											// ?????? ???????????? ?????? ?????? ??????
											List<UpbitTicker> upbitTickers = upCmd.GetTicket(my_market);
											UpbitTicker t = upbitTickers.get(0);
																				
											int upbit_price = (int)t.getTrade_price(); // upbit ??????
											int my_price = (int)Double.parseDouble(mycount.getAvg_buy_price());
											int interval = upbit_price - my_price; // ????????? - ?????????
											int rate = (interval*100)/my_price; // ????????? %
											String price = String.valueOf(upbit_price);
											String volume = String.valueOf(currency_unit/upbit_price);
											
											//System.out.println("["+my_market+"][?????????:"+my_price+"][????????????:"+upbit_price+"][?????????:"+rate+"]");
											if(rate < limit_minus_rate) { // ???????????? ??????????????? ?????????
												// ?????? ????????????   	
												upOrders = new UpOrders();
												upOrders.setMarket(my_market);
												upOrders.setOrd_type("limit");
												upOrders.setPrice(price);
												upOrders.setSide("bid"); 
												upOrders.setVolume(volume);
												
												// ?????? Upbit ??????
												UpOrdersCallBack upOrdersCallBack = upCmd.PostOrders(upbitUser, upOrders);
												if(upOrdersCallBack.getError() != null) {
													System.out.println("["+t.getMarket()+"][??????????????????]["+upOrdersCallBack.getError().getMessage()+"]["+upOrdersCallBack.getError().getName()+"]");
												}else {																					
													System.out.println("["+t.getMarket()+"]["+price+"]["+upOrdersCallBack.getState()+"][??????????????????]");
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
						System.out.println("[????????????......]");
					}
				}
			}
		}
		// #################### END ?????? ?????? END #################### //
						
		// #################### START ?????? ?????? START #################### //		
		for (UpbitUser upbitUser : UpbitMemory.UpbitUsers) {
			for (UpbitUserAccount upbitUserAccount : upbitUser.getUpbitUserAccounts()) {
				if(!upbitUserAccount.getMarket().equals("KRW-KRW")) {						
					Thread.sleep(100);
					
					// ?????? ????????? 							
					String sAvg = upbitUserAccount.getAvg_buy_price();															
					int avg = (int)Double.parseDouble(sAvg); // ?????? ?????????
					int insAvg = avg + (int)(avg*0.01);					
										
					//System.out.println("["+upbitUserAccount.getMarket()+"][up_my_price "+ (int)Double.parseDouble(sAvg)+"]");								
					
					// ?????? ???????????? ?????? ?????? ??????					
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
						// ?????? ????????????		
						upOrders = new UpOrders();
						upOrders.setMarket(upbitUserAccount.getMarket());
						upOrders.setOrd_type("limit");
						upOrders.setPrice(price);
						upOrders.setSide("ask"); 
						upOrders.setVolume(volume);
						
						// ?????? Upbit ??????(?????? ?????? ????????? ??????)		
						if((int)Double.parseDouble(volume) != 0) {
							UpOrdersCallBack upOrdersCallBack = upCmd.PostOrders(upbitUser, upOrders);							
							if(upOrdersCallBack.getError() != null) {							
								System.out.println("["+upbitUserAccount.getMarket()+"]["+price+"]["+volume+"][??????????????????]["+upOrdersCallBack.getError().getMessage()+"]["+upOrdersCallBack.getError().getName()+"]");
							}else {
								System.out.println("["+upbitUserAccount.getMarket()+"]["+good_money+"]["+upOrdersCallBack.getState()+"][??????????????????]");
								
								// ?????? Upbit ?????? ??????
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
						//System.out.println("["+upbitUserAccount.getMarket()+"]["+insAvg+"]["+bitAvg+"]["+good_money+"][?????? ?????????]");
					}														
				}
			}
		}				
		// #################### END ?????? ?????? END #################### //
		
		// ?????? ????????? 200??? ?????????
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
