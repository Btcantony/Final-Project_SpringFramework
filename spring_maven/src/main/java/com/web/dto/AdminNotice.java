package main.java.com.web.dto;

import java.util.Date;

public class AdminNotice {
	private int seq;
	private String title;
	private String content;
	private String email;
	private Date regdate;
	private Date updatedate;
	
	private String seqs;
	
	
	
	public String getSeqs() {
		return seqs;
	}
	public void setSeqs(String seqs) {
		this.seqs = seqs;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
}
