package main.java.com.web.service;

import java.util.List;

import main.java.com.web.dto.MainBestBrand;
import main.java.com.web.dto.MainCategory;
import main.java.com.web.dto.MainJust;
import main.java.com.web.dto.MainSwiperImg;
import main.java.com.web.dto.Master;
import main.java.com.web.dto.Notice;
import main.java.com.web.dto.ProductImgs;

public interface Main1Service {
	String selectTest() throws Exception;

	List<MainSwiperImg> select_main_swiper();

	List<MainCategory> select_main_category();

	List<MainJust> select_main_just(MainJust mainJust);

	Master select_main(Master master);

	List<MainBestBrand> select_main_brand();

	List<Notice> select_notice(Notice notice);

	void insert_notice(Notice notice);

	Notice select_notice_detail(int seq);

	int select_notice_total();

	MainJust select_product_detail(int seq);

	List<ProductImgs> select_ProductImgs(ProductImgs productImgs);

	void delete_notice(int seq);

	void update_notice(Notice notice);

	List<MainJust> select_search_product(String keyword);

	MainCategory select_maincategory_detail(MainCategory mainCategory);

	
	
	
	// 카테고리 ABCDEFGHIJ 성공
	List<MainJust> select_category_detail(String category);

}
