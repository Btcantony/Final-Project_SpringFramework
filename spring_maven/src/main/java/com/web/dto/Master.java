package main.java.com.web.dto;

import java.util.List;

public class Master extends AbsResponseVO {
	private String id;
	private int total_cnt;
	private int total_point;

	private List<MainSwiperImg> listMainSwiperImg;

	private List<MainCategory> listMainCategory;

	private List<MainJust> listMainJust;

	private List<Notice> listNotice;

	private List<MainBestBrand> listMainBestBrand;

	private List<ProductImgs> listProductImgs;

	private List<Addr> listAddr;

	private Order order;

	private List<Order> listOrder;

	private List<OrderStatistics> listOrderStatistics;

	private List<OrderStatistics> listCateStatistics;

	private Item item; // 확실하지는 않지만 만들어놓음(정훈)

	private MainJust mainJust;

	private Join join;

	// 준현 Admin 회원 호출
	private List<Join> listJoin;

	public List<OrderStatistics> getListCateStatistics() {
		return listCateStatistics;
	}

	public void setListCateStatistics(List<OrderStatistics> listCateStatistics) {
		this.listCateStatistics = listCateStatistics;
	}

	public List<Join> getListJoin() {
		return listJoin;
	}

	public List<OrderStatistics> getListOrderStatistics() {
		return listOrderStatistics;
	}

	public void setListOrderStatistics(List<OrderStatistics> listOrderStatistics) {
		this.listOrderStatistics = listOrderStatistics;
	}

	public void setListJoin(List<Join> listJoin) {
		this.listJoin = listJoin;
	}

	private Notice notice;

	private Addr addr;

	private MainCategory mainCategory;

	private Files files;

	private Admin admin;

	// 준현 주문 담기

	private OrderBBW orderBBW;

	private List<OrderBBW> listOrderBBW;

	// 준현 주문 아이템 담기
	private OrderItem orderItem;

	private List<OrderItem> listOrderItem;

	//
	
	//준현 Admin게시판 
	private AdminNotice adminNotice;
	
	private List<AdminNotice> listAdminNotice;
	

	public AdminNotice getAdminNotice() {
		return adminNotice;
	}

	public void setAdminNotice(AdminNotice adminNotice) {
		this.adminNotice = adminNotice;
	}

	
	
	public List<AdminNotice> getListAdminNotice() {
		return listAdminNotice;
	}

	public void setListAdminNotice(List<AdminNotice> listAdminNotice) {
		this.listAdminNotice = listAdminNotice;
	}
	
	//

	public List<Order> getListOrder() {
		return listOrder;
	}

	public void setListOrder(List<Order> listOrder) {
		this.listOrder = listOrder;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public List<Addr> getListAddr() {
		return listAddr;
	}

	public void setListAddr(List<Addr> listAddr) {
		this.listAddr = listAddr;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Files getFiles() {
		return files;
	}

	public void setFiles(Files files) {
		this.files = files;
	}

	public MainCategory getMainCategory() {
		return mainCategory;
	}

	public void setMainCategory(MainCategory mainCategory) {
		this.mainCategory = mainCategory;
	}

	// chat 준현

	public int getTotal_point() {
		return total_point;
	}

	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}

	private User user;

	private List<ChatRoom> listChatRoom;

	private List<Message> message;

	// chat 준현 Getter Setter시작

	public User getUser() {
		return user;
	}

	public Addr getAddr() {
		return addr;
	}

	public void setAddr(Addr addr) {
		this.addr = addr;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<ChatRoom> getListChatRoom() {
		return listChatRoom;
	}

	public void setListChatRoom(List<ChatRoom> listChatRoom) {
		this.listChatRoom = listChatRoom;
	}

	public List<Message> getMessage() {
		return message;
	}

	public void setMessage(List<Message> message) {
		this.message = message;
	}

	// 준현 Chat 게터세터 끝

	public List<ProductImgs> getListProductImgs() {
		return listProductImgs;
	}

	public void setListProductImgs(List<ProductImgs> listProductImgs) {
		this.listProductImgs = listProductImgs;
	}

	public int getTotal_cnt() {
		return total_cnt;
	}

	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public List<Notice> getListNotice() {
		return listNotice;
	}

	public void setListNotice(List<Notice> listNotice) {
		this.listNotice = listNotice;
	}

	public Join getJoin() {
		return join;
	}

	public void setJoin(Join join) {
		this.join = join;
	}

	public List<MainBestBrand> getListMainBestBrand() {
		return listMainBestBrand;
	}

	public void setListMainBestBrand(List<MainBestBrand> listMainBestBrand) {
		this.listMainBestBrand = listMainBestBrand;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public MainJust getMainJust() {
		return mainJust;
	}

	public void setMainJust(MainJust mainJust) {
		this.mainJust = mainJust;
	}

	public List<MainSwiperImg> getListMainSwiperImg() {
		return listMainSwiperImg;
	}

	public void setListMainSwiperImg(List<MainSwiperImg> listMainSwiperImg) {
		this.listMainSwiperImg = listMainSwiperImg;
	}

	public List<MainCategory> getListMainCategory() {
		return listMainCategory;
	}

	public void setListMainCategory(List<MainCategory> listMainCategory) {
		this.listMainCategory = listMainCategory;
	}

	public List<MainJust> getListMainJust() {
		return listMainJust;
	}

	public void setListMainJust(List<MainJust> listMainJust) {
		this.listMainJust = listMainJust;
	}

	// 준현 BBW 주문
	public OrderBBW getOrderBBW() {
		return orderBBW;
	}

	public void setOrderBBW(OrderBBW orderBBW) {
		this.orderBBW = orderBBW;
	}

	public List<OrderBBW> getListOrderBBW() {
		return listOrderBBW;
	}

	public void setListOrderBBW(List<OrderBBW> listOrderBBW) {
		this.listOrderBBW = listOrderBBW;
	}

	public OrderItem getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	public List<OrderItem> getListOrderItem() {
		return listOrderItem;
	}

	public void setListOrderItem(List<OrderItem> listOrderItem) {
		this.listOrderItem = listOrderItem;
	}
	// 준현

	@Override
	public void success() {
		this.setCode("0000");
		this.setMsg("success");
	}

	@Override
	public void success(String code, String msg) {
		this.setCode(code);
		this.setMsg(msg);
	}

	@Override
	public void fail(String code, String msg) {
		this.setCode(code);
		this.setMsg(msg);
	}
}
