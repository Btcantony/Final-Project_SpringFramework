package main.java.com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.java.com.web.dao.Main1Dao;
import main.java.com.web.dto.MainBestBrand;
import main.java.com.web.dto.MainCategory;
import main.java.com.web.dto.MainJust;
import main.java.com.web.dto.MainSwiperImg;
import main.java.com.web.dto.Master;
import main.java.com.web.dto.Notice;
import main.java.com.web.dto.ProductImgs;
import main.java.com.web.service.Main1Service;

@Service("main1Service")
public class Main1ServiceImpl implements Main1Service {

	@Resource(name = "main1Dao")
	private Main1Dao main1Dao;

	@Override
	public String selectTest() throws Exception {
		return main1Dao.selectTest();
	}

	@Override
	public List<MainSwiperImg> select_main_swiper() {
		return main1Dao.select_main_swiper();
	}

	@Override
	public List<MainCategory> select_main_category() {
		return main1Dao.select_main_category();
	}

	@Override
	public List<MainJust> select_main_just(MainJust mainJust) {
		return main1Dao.select_main_just(mainJust);
	}

	/*
	 * description : 메인 화면의 모든 정보
	 */
	@Override
	public Master select_main(Master master) {
		master.setListMainCategory(main1Dao.select_main_category());
		master.setListMainJust(main1Dao.select_main_just(master.getMainJust()));
		master.setListMainSwiperImg(main1Dao.select_main_swiper());

		return master;
	}

	@Override
	public List<MainBestBrand> select_main_brand() {
		return main1Dao.select_main_brand();
	}

	@Override
	public List<Notice> select_notice(Notice notice) {
		return main1Dao.select_notice(notice);
	}

	@Override
	public void insert_notice(Notice notice) {
		main1Dao.insert_notice(notice);
	}

	@Override
	public Notice select_notice_detail(int seq) {
		return main1Dao.select_notice_detail(seq);
	}

	@Override
	public int select_notice_total() {
		return main1Dao.select_notice_total();
	}

	@Override
	public MainJust select_product_detail(int seq) {
		return main1Dao.select_product_detail(seq);
	}

	@Override
	public List<ProductImgs> select_ProductImgs(ProductImgs productImgs) {
		return main1Dao.select_ProductImgs(productImgs);
	}

	@Override
	public void delete_notice(int seq) {
		main1Dao.delete_notice(seq);

	}

	@Override
	public void update_notice(Notice notice) {
		main1Dao.update_notice(notice);

	}

	@Override
	public List<MainJust> select_search_product(String keyword) {
		return main1Dao.select_search_product(keyword);
	}

//
//	@Override
//	public MainCategory select_maincategory_detail(MainCategory mainCategory) {
//		return main1Dao.select_maincategory_detail(mainCategory);
//	}
//
//
//

	@Override
	public List<MainJust> select_category_detail(String category) {
		return main1Dao.select_category_detail(category);
	}

	@Override
	public MainCategory select_maincategory_detail(MainCategory mainCategory) {
		// TODO Auto-generated method stub
		return null;
	}

}
