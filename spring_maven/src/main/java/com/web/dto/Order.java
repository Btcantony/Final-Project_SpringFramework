package main.java.com.web.dto;

import java.util.List;

public class Order {
	private String orderNum; // 주문번호
	private String orderDate; // 주문날짜 yyyymmdd
	private String addr_total; // 배송주소total (home) 서울특별시 송파구 송파동 검은대문
	private String deliver_type; // 배송방법 일반배송
	private String cancel_yn; // 취소여부
	private String deliver_yn; // 배송완료 여부
	private String statusCode; // 배송 타입
	private String email; // 사용자
	private List<Item> listItem; // 상품 목록

	private int point_pay; // 구매당시 포인트 사용 양

	private int deliver_yn_n_cnt; // 배송 미완료
	private int deliver_yn_y_cnt; // 배송 중
	private int deliver_yn_f_cnt; // 배송 완료

	public int getDeliver_yn_n_cnt() {
		return deliver_yn_n_cnt;
	}

	public void setDeliver_yn_n_cnt(int deliver_yn_n_cnt) {
		this.deliver_yn_n_cnt = deliver_yn_n_cnt;
	}

	public int getDeliver_yn_y_cnt() {
		return deliver_yn_y_cnt;
	}

	public void setDeliver_yn_y_cnt(int deliver_yn_y_cnt) {
		this.deliver_yn_y_cnt = deliver_yn_y_cnt;
	}

	public int getDeliver_yn_f_cnt() {
		return deliver_yn_f_cnt;
	}

	public void setDeliver_yn_f_cnt(int deliver_yn_f_cnt) {
		this.deliver_yn_f_cnt = deliver_yn_f_cnt;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public int getPoint_pay() {
		return point_pay;
	}

	public void setPoint_pay(int point_pay) {
		this.point_pay = point_pay;
	}

	public List<Item> getListItem() {
		return listItem;
	}

	public void setListItem(List<Item> listItem) {
		this.listItem = listItem;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
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

	public String getDeliver_type() {
		return deliver_type;
	}

	public void setDeliver_type(String deliver_type) {
		this.deliver_type = deliver_type;
	}

}
