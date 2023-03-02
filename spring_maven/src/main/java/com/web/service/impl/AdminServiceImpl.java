package main.java.com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.java.com.web.dao.AdminDao;
import main.java.com.web.dto.Admin;
import main.java.com.web.dto.AdminNotice;
import main.java.com.web.dto.Files;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.MainJust;
import main.java.com.web.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name="AdminDao")
	private AdminDao adminDao;

	@Override
	public void insert_file(Files file) {
		adminDao.insert_file(file);		
	}

	@Override
	public Admin select_admin(Admin admin) {
		return adminDao.select_admin(admin);		
	}

	@Override
	public List<MainJust> select_listMainJust(String email) {
		return adminDao.select_listMainJust(email);		
	}

	@Override
	public void insert_main_just(MainJust mainJust) {
		adminDao.insert_main_just(mainJust);		
	}

	@Override
	public MainJust select_mainJust_one(int seq) {
		return adminDao.select_mainJust_one(seq);
	}

	@Override
	public void update_main_just(MainJust mainJust) {
		adminDao.update_main_just(mainJust);		
	}

	@Override
	public void delete_main_just(int seq) {
		adminDao.delete_main_just(seq);
	}

	@Override
	public int select_order_statistics(String dt) {
		return adminDao.select_order_statistics(dt);		
	}

	@Override
	public List<String> select_mainjust_distinct() {
		return adminDao.select_mainjust_distinct();		
	}

	@Override
	public int select_cate_statistics(String cate) {
		return adminDao.select_cate_statistics(cate);	
	}

	//게시판 공지사항 준현
	@Override
	public void insert_adminnotice(AdminNotice adminNotice) {
		adminDao.insert_adminnotice(adminNotice);	
	}

	@Override
	public List<AdminNotice> select_adminnotice_list() {
		return adminDao.select_adminnotice_list();
	}   

	@Override
	public List<Join> select_listJoin() {
		return adminDao.select_listJoin();		
	}

	@Override
	public AdminNotice select_adminnotice_detail(int seq) {
		return adminDao.select_adminnotice_detail(seq);
	}

	@Override
	public void delete_adminnotice(int seq) {
		adminDao.delete_adminnotice(seq);	
	}

	@Override
	public void update_adminnotice(AdminNotice adminNotice) {
		adminDao.update_adminnotice(adminNotice);
	}

	@Override
	public void delete_user(String email) {
		adminDao.delete_user(email);
	}

	
}
