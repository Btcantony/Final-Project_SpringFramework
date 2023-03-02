package main.java.com.web.service;

import java.util.List;

import main.java.com.web.dto.Addr;
import main.java.com.web.dto.Item;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.Order;

public interface Login1Service {

	void insert_user(Join join);

	int select_user_count(Join join);
	
	int isMember(Join join);
	
	List<Addr> select_addr_all(String email);

	void insert_myaddress(Addr addr);
	
//	-------------------------------대청소 시작------------------------------------------------------------------------------
	
	Addr select_addr(Addr addr);
	
	
	int select_point(String email);

	
	
	
	
	

	void insert_order(Order order);


	void insert_item(Item item);


	List<Order> select_order_all(Order order);


	List<Item> select_order_items(String orderNum);

	Join select_my_profile(String email);

	Order select_order_all_cnt(Order orderDb);
	
	
	
	
	
	
	
}
