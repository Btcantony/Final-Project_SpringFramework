package main.java.com.web.dto;

public class Notice {
	private int seq;
	private String title;
	private String content;
	private String email;
	private String img_url;
	private String date;
	
	//준현 검색 (추가)
	private String keyword;
	
	

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	//

	// extra 변수
	private int st_num; // 페이징 시작
	private int ed_num; // 페이징 끝

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

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
