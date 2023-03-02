package main.java.com.web.service;

import java.util.List;

import main.java.com.web.dto.Admin;
import main.java.com.web.dto.AdminNotice;
import main.java.com.web.dto.Files;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.MainJust;

public interface AdminService {
	
	void insert_file(Files file);

	Admin select_admin(Admin admin);

	List<MainJust> select_listMainJust(String email);
	
	void insert_main_just(MainJust mainJust);

	MainJust select_mainJust_one(int seq);

	void update_main_just(MainJust mainJust);

	void delete_main_just(int parseInt);	
	
	//준현 회원 조회
	List<Join> select_listJoin();

	int select_order_statistics(String dt);

	List<String> select_mainjust_distinct();

	int select_cate_statistics(String cate);
	
	//공지사항 게시판 준현 (목록 띄우기만 하는거에는 파라미터타입이 필요가 없음
	List<AdminNotice> select_adminnotice_list();
	
	void insert_adminnotice(AdminNotice adminNotice);

	AdminNotice select_adminnotice_detail(int seq);

	void delete_adminnotice(int seq);

	void update_adminnotice(AdminNotice adminNotice);

	//user탈퇴
	void delete_user(String email);
}
