package main.java.com.web.dto.upbit;

public class UPBIT_MARKET {
	private String market;
	private String korean_name;
	private String english_name;
	private int rate;
	private int cal_cnt;
	private String reg_date;

	private int trade_price_s;
	private int trade_price_e;
	private double raiseRate;
	private int raisePrice;
	private String buyed;

	public String getBuyed() {
		return buyed;
	}

	public void setBuyed(String buyed) {
		this.buyed = buyed;
	}

	public int getTrade_price_s() {
		return trade_price_s;
	}

	public void setTrade_price_s(int trade_price_s) {
		this.trade_price_s = trade_price_s;
	}

	public int getTrade_price_e() {
		return trade_price_e;
	}

	public void setTrade_price_e(int trade_price_e) {
		this.trade_price_e = trade_price_e;
	}

	public double getRaiseRate() {
		return raiseRate;
	}

	public void setRaiseRate(double raiseRate) {
		this.raiseRate = raiseRate;
	}

	public int getRaisePrice() {
		return raisePrice;
	}

	public void setRaisePrice(int raisePrice) {
		this.raisePrice = raisePrice;
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

	public String getEnglish_name() {
		return english_name;
	}

	public void setEnglish_name(String english_name) {
		this.english_name = english_name;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public int getCal_cnt() {
		return cal_cnt;
	}

	public void setCal_cnt(int cal_cnt) {
		this.cal_cnt = cal_cnt;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}
