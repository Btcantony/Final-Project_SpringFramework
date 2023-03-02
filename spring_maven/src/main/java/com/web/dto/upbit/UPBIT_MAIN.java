package main.java.com.web.dto.upbit;

public class UPBIT_MAIN {
	private String market;
	private String korean_name;
	private int win;
	private int trade_price;
	private double raiseRateTotal;
	private int raisePriceTotal;
	private String reg_date;

	private int cal_up_cnt; // n건 연속	

	public int getCal_up_cnt() {
		return cal_up_cnt;
	}

	public void setCal_up_cnt(int cal_up_cnt) {
		this.cal_up_cnt = cal_up_cnt;
	}

	public int getTrade_price() {
		return trade_price;
	}

	public void setTrade_price(int trade_price) {
		this.trade_price = trade_price;
	}

	public String getMarket() {
		return market;
	}

	public void setMarket(String market) {
		this.market = market;
	}

	public String getKorean_name() {
		return korean_name;
	}

	public void setKorean_name(String korean_name) {
		this.korean_name = korean_name;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public double getRaiseRateTotal() {
		return raiseRateTotal;
	}

	public void setRaiseRateTotal(double raiseRateTotal) {
		this.raiseRateTotal = raiseRateTotal;
	}

	public int getRaisePriceTotal() {
		return raisePriceTotal;
	}

	public void setRaisePriceTotal(int raisePriceTotal) {
		this.raisePriceTotal = raisePriceTotal;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}
