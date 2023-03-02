package main.java.com.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.java.com.web.dto.Addr;
import main.java.com.web.dto.Item;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.Order;

@Repository("login1Dao")
public class Login1Dao {

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void insert_user(Join join) {
		sqlSession.insert("Login1.insert_user", join);
	}

	public int select_user_count(Join join) {
		return sqlSession.selectOne("Login1.select_user_count", join);
	}

	public int isMember(Join join) {
		return sqlSession.selectOne("Login.isMember", join);
	}

	
	
	
	
	
	
	
	public List<Addr> select_addr_all(String email) {
		return sqlSession.selectList("Login1.select_addr_all", email);
	}

	public void insert_myaddress(Addr addr) {
		sqlSession.insert("Login1.insert_myaddress", addr);
	}

	//my buy 주소, 이메일, 상품은 쿠기로 떄려박아서x 
	public Addr select_addr(Addr addr) {
		return sqlSession.selectOne("Login1.select_addr", addr);
	}

	public int select_point(String email) {
		return sqlSession.selectOne("Login1.select_point", email);
	}
	//
	
    //ajax buy_commit
	public void insert_order(Order order) {
		sqlSession.insert("Login1.insert_order", order);
	}

	public void insert_item(Item item) {
		sqlSession.insert("Login1.insert_item", item);
	}

	//
	
	//ajax_myorderlist
	public List<Order> select_order_all(Order order) {
		return sqlSession.selectList("Login1.select_order_all", order);
	}

	public List<Item> select_order_items(String orderNum) {
		return sqlSession.selectList("Login1.select_order_items", orderNum);
	}

	

	public Order select_order_all_cnt(Order orderDb) {
		return sqlSession.selectOne("Login1.select_order_all_cnt", orderDb);
	}

	
	
	public Join select_my_profile(String email) {
		return sqlSession.selectOne("Login1.select_my_profile", email);
	}
	
	
	
}
