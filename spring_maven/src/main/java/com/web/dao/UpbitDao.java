package main.java.com.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.java.com.web.dto.Admin;
import main.java.com.web.dto.AdminNotice;
import main.java.com.web.dto.Files;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.MainJust;
import main.java.com.web.dto.upbit.UPBIT_MAIN;
import main.java.com.web.dto.upbit.UPBIT_MARKET;
import main.java.com.web.dto.upbit.UPBIT_RATELOG;
import main.java.com.web.dto.upbit.UpCalResult;
import main.java.com.web.dto.upbit.UpOrdersCallBack;
import main.java.com.web.dto.upbit.UpbitMarket;
import main.java.com.web.dto.upbit.UpbitTicker;
import main.java.com.web.dto.upbit.UpbitUser;

@Repository("UpbitDao")
public class UpbitDao {

	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

	public UpbitUser select_user(UpbitUser upbitUser) {
		return sqlSession.selectOne("Upbit.select_user", upbitUser);	
	}

	public List<UpbitUser> select_users(UpbitUser upbitUser) {
		return sqlSession.selectList("Upbit.select_users", upbitUser);
	}

	public void delete_market_all() {
		sqlSession.delete("Upbit.delete_market_all");		
	}

	public void insert_market(UpCalResult upCalResult) {
		sqlSession.insert("Upbit.insert_market",upCalResult);
	}

	public void update_market(UpCalResult c) {
		sqlSession.update("Upbit.update_market",c);
	}

	public void delete_market_main_all() {
		sqlSession.delete("Upbit.delete_market_main_all");
	}

	public void insert_market_main(UpbitMarket upbitMarket) {
		sqlSession.insert("Upbit.insert_market_main",upbitMarket);
	}

	public void update_market_main(UpCalResult c) {
		sqlSession.update("Upbit.update_market_main",c);
	}

	public void update_market_main_win() {
		sqlSession.update("Upbit.update_market_main_win");
	}

	public void update_market_main_start_price(UpbitTicker t) {
		sqlSession.update("Upbit.update_market_main_start_price", t);
	}

	public List<UPBIT_MAIN> select_upbit_main_win(int i) {
		return sqlSession.selectList("Upbit.select_upbit_main_win", i);
	}

	public List<UPBIT_MARKET> select_upbit_market_top(UPBIT_MAIN m) {
		return sqlSession.selectList("Upbit.select_upbit_market_top", m);
	}

	public void insert_upOrders(UpOrdersCallBack upOrdersCallBack) {
		sqlSession.update("Upbit.insert_upOrders", upOrdersCallBack);
	}

	public List<UpOrdersCallBack> select_order_print(UpbitUser u) {
		return sqlSession.selectList("Upbit.select_order_print", u);
	}

	public void update_order(UpOrdersCallBack callback) {
		sqlSession.update("Upbit.update_order", callback);
	}

	public void update_buyed(UpOrdersCallBack upOrdersCallBack) {
		sqlSession.update("Upbit.update_buyed", upOrdersCallBack);		
	}

	public String select_avg(String market) {
		return sqlSession.selectOne("Upbit.select_avg", market);
	}

	public void delete_bid_done_remove(String market) {
		sqlSession.delete("Upbit.delete_bid_done_remove", market);	
	}

	public UPBIT_MAIN select_best_down_win_one() {
		return sqlSession.selectOne("Upbit.select_best_down_win_one");
	}

	public void insert_ratelog(UPBIT_RATELOG upbit_ratelog) {
		sqlSession.insert("Upbit.insert_ratelog", upbit_ratelog);	
	}	
}
