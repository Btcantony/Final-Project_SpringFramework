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

// 왜 AdminNotice가 아니라, Admin인가
@Repository("AdminDao")
public class AdminDao {

	@Autowired
    private SqlSession sqlSession;
 
//    public void setSqlSession(SqlSession sqlSession){
//        this.sqlSession = sqlSession;
//    }

	public void insert_file(Files file) {
		sqlSession.insert("Admin.insert_file", file);		
	}

	public Admin select_admin(Admin admin) {
		return sqlSession.selectOne("Admin.select_admin", admin);	
	}

	public List<MainJust> select_listMainJust(String email) {
		return sqlSession.selectList("Admin.select_listMainJust", email);
	}

	public void insert_main_just(MainJust mainJust) {
		sqlSession.insert("Admin.insert_main_just", mainJust);		
	}

	public MainJust select_mainJust_one(int seq) {
		return sqlSession.selectOne("Admin.select_mainJust_one", seq);
	}

	public void update_main_just(MainJust mainJust) {
		sqlSession.update("Admin.update_main_just", mainJust);
	}

	public void delete_main_just(int seq) {
		sqlSession.delete("Admin.delete_main_just", seq);
	}

	public List<Join> select_listJoin(String email) {
		return sqlSession.selectList("Admin.select_listJoin", email);
	}

	public int select_order_statistics(String dt) {
		return sqlSession.selectOne("Admin.select_order_statistics", dt);
	}

	public List<String> select_mainjust_distinct() {
		return sqlSession.selectList("Admin.select_mainjust_distinct");
	}

	public int select_cate_statistics(String cate) {
		return sqlSession.selectOne("Admin.select_cate_statistics", cate);
	}

	public void insert_adminnotice(AdminNotice adminNotice) {
		//sqlSession.insert("AdminNotice.insert_adminnotice", adminNotice); <= TODO : AdminNotice 이 머꼬?
		sqlSession.insert("Admin.insert_adminnotice", adminNotice);
	}

	public List<AdminNotice> select_adminnotice_list() {
		return sqlSession.selectList("Admin.select_adminnotice_list");
	}	

	public List<Join> select_listJoin() {
		return sqlSession.selectList("Admin.select_listJoin");
	}

	public AdminNotice select_adminnotice_detail(int seq) {
		return sqlSession.selectOne("Admin.select_adminnotice_detail", seq);
	}

	public void delete_adminnotice(int seq) {
		sqlSession.delete("Admin.delete_adminnotice", seq);
	}

	public void update_adminnotice(AdminNotice adminNotice) {
		sqlSession.update("Admin.update_adminnotice", adminNotice);
	}

	public void delete_user(String email) {
		sqlSession.delete("Admin.delete_user", email);
	}

}
