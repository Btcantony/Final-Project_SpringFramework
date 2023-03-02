package main.java.com.web.dto.upbit;

import java.util.List;

public class UpbitUser {
	private String access_key;
	private String secret_key;
	private String img_url;
	private String name;
	private String status_code;
	private String run_code;
	private String reg_date;

	private List<UpbitUserAccount> upbitUserAccounts;

	public List<UpbitUserAccount> getUpbitUserAccounts() {
		return upbitUserAccounts;
	}

	public void setUpbitUserAccounts(List<UpbitUserAccount> upbitUserAccounts) {
		this.upbitUserAccounts = upbitUserAccounts;
	}

	public String getStatus_code() {
		return status_code;
	}

	public void setStatus_code(String status_code) {
		this.status_code = status_code;
	}

	public String getRun_code() {
		return run_code;
	}

	public void setRun_code(String run_code) {
		this.run_code = run_code;
	}

	public String getAccess_key() {
		return access_key;
	}

	public void setAccess_key(String access_key) {
		this.access_key = access_key;
	}

	public String getSecret_key() {
		return secret_key;
	}

	public void setSecret_key(String secret_key) {
		this.secret_key = secret_key;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}
