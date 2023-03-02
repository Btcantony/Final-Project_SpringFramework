package main.java.com.web.dto;

public class MainJust {

	private int seq;
	private String url;
	private String brand;
	private String name;
	private String name_kor;
	private int price_recent;
	private int price_sale;
	private String model_number;
	private String color;
	private int price_public;
	private int price;
	private String date;
	private String category;
	private String user;

	// Ext 파라미터
	private String seqs;
	private String cmd;

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public String getSeqs() {
		return seqs;
	}

	public void setSeqs(String seqs) {
		this.seqs = seqs;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	// 검색을 위한 키워드 변수 추가 정훈
	private String keyword;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	// extra 변수
	private int st_num; // 페이징 시작
	private int ed_num; // 페이징 끝

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getName_kor() {
		return name_kor;
	}

	public void setName_kor(String name_kor) {
		this.name_kor = name_kor;
	}

	public int getPrice_recent() {
		return price_recent;
	}

	public void setPrice_recent(int price_recent) {
		this.price_recent = price_recent;
	}

	public int getPrice_sale() {
		return price_sale;
	}

	public void setPrice_sale(int price_sale) {
		this.price_sale = price_sale;
	}

	public String getModel_number() {
		return model_number;
	}

	public void setModel_number(String model_number) {
		this.model_number = model_number;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getPrice_public() {
		return price_public;
	}

	public void setPrice_public(int price_public) {
		this.price_public = price_public;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getSt_num() {
		return st_num;
	}

	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}

	public int getEd_num() {
		return ed_num;
	}

	public void setEd_num(int ed_num) {
		this.ed_num = ed_num;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
