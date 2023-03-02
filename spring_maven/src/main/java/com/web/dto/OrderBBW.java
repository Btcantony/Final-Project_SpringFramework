package main.java.com.web.dto;

import java.util.List;

//준현 주문 Total
public class OrderBBW {
	private String orderNum; // 주문번호
	private String orderDate; // 주문날짜 yyyymmdd
	private String addr_total; // 배송주소total (home) 서울특별시 송파구 송파동 검은대문
	private String deliver_type; // 배송방법
	private String cancel_yn; // 취소여부
	private String deliver_yn; // 배송완료 여부
	private String email; // 사용자
	private int total_price; // 최종금액

	private List<OrderItem> listOrderItem; // 상품 목록
	
	private int point_pay;  // 구매당시 포인트 사용 양

	public int getPoint_pay() {
		return point_pay;
	}

	public void setPoint_pay(int point_pay) {
		this.point_pay = point_pay;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getAddr_total() {
		return addr_total;
	}

	public void setAddr_total(String addr_total) {
		this.addr_total = addr_total;
	}

	public String getDeliver_type() {
		return deliver_type;
	}

	public void setDeliver_type(String deliver_type) {
		this.deliver_type = deliver_type;
	}

	public String getCancel_yn() {
		return cancel_yn;
	}

	public void setCancel_yn(String cancel_yn) {
		this.cancel_yn = cancel_yn;
	}

	public String getDeliver_yn() {
		return deliver_yn;
	}

	public void setDeliver_yn(String deliver_yn) {
		this.deliver_yn = deliver_yn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<OrderItem> getListOrderItem() {
		return listOrderItem;
	}

	public void setListOrderItem(List<OrderItem> listOrderItem) {
		this.listOrderItem = listOrderItem;
	}

}