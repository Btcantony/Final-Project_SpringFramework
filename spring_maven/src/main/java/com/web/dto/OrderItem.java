package main.java.com.web.dto;

//준현 주문 Item
public class OrderItem { //기존엔 Product였지만 Item으로 변경. 
	//주문번호
	private String orderNum;
	private String url;
	private String brand;
	private String name;
	private int seq;
	private int price;
	
	// 안쓸예정
	private String model_num;
	private String tb_nm;
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
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
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getModel_num() {
		return model_num;
	}
	public void setModel_num(String model_num) {
		this.model_num = model_num;
	}
	public String getTb_nm() {
		return tb_nm;
	}
	public void setTb_nm(String tb_nm) {
		this.tb_nm = tb_nm;
	}
	
}
