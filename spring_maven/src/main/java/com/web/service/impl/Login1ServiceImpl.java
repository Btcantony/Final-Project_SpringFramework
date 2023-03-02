package main.java.com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.java.com.web.dao.Login1Dao;
import main.java.com.web.dto.Addr;
import main.java.com.web.dto.Item;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.Order;
import main.java.com.web.service.Login1Service;

@Service("login1Service")
public class Login1ServiceImpl implements Login1Service {

	@Resource(name = "login1Dao")
	private Login1Dao login1Dao;

	@Override
	public void insert_user(Join join) {
		login1Dao.insert_user(join);
	}

	@Override
	public int select_user_count(Join join) {
		return login1Dao.select_user_count(join);
	}

	@Override
	public int isMember(Join join) {
		return login1Dao.isMember(join);
	}

	@Override
	public List<Addr> select_addr_all(String email) {
		return login1Dao.select_addr_all(email);
	}

	@Override
	public void insert_myaddress(Addr addr) {
		login1Dao.insert_myaddress(addr);
	}

	
//	------------------------------대청소------------------------------------------------
	
	@Override
	public Addr select_addr(Addr addr) {
		return login1Dao.select_addr(addr);
	}

	@Override
	public int select_point(String email) {
		return login1Dao.select_point(email);
	}

	
	
	
	
	@Override
	public void insert_order(Order order) {
		login1Dao.insert_order(order);
	}

	@Override
	public void insert_item(Item item) {
		login1Dao.insert_item(item);
	}

	@Override
	public List<Order> select_order_all(Order order) {
		return login1Dao.select_order_all(order);
	}

	@Override
	public List<Item> select_order_items(String orderNum) {
		return login1Dao.select_order_items(orderNum);
	}

	@Override
	public Join select_my_profile(String email) {
		return login1Dao.select_my_profile(email);
	}

	@Override
	public Order select_order_all_cnt(Order orderDb) {
		return login1Dao.select_order_all_cnt(orderDb);
	}

}
