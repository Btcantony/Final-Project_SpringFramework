package main.java.com.web.dto.upbit;

public class UPBIT_RATELOG {
	private String ymd;
	private String market;
	private int calnum;
	private int win;
	private String reg_date;

	public int getCalnum() {
		return calnum;
	}

	public void setCalnum(int calnum) {
		this.calnum = calnum;
	}

	public String getYmd() {
		return ymd;
	}

	public void setYmd(String ymd) {
		this.ymd = ymd;
	}

	public String getMarket() {
		return market;
	}

	public void setMarket(String market) {
		this.market = market;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}
