package main.java.com.web.dto.upbit;

public class UpCalResult implements Comparable<UpCalResult> {
	private String korean_name;
	private String market;
	private int trade_price_1;
	private int trade_price_10;
	private int raisePrice;
	private double raiseRate;
	private int cal_cnt;

	private String buyed;

	public String getBuyed() {
		return buyed;
	}

	public void setBuyed(String buyed) {
		this.buyed = buyed;
	}

	public int getCal_cnt() {
		return cal_cnt;
	}

	public void setCal_cnt(int cal_cnt) {
		this.cal_cnt = cal_cnt;
	}

	public double getRaiseRate() {
		return raiseRate;
	}

	public void setRaiseRate(double raiseRate) {
		this.raiseRate = raiseRate;
	}

	public String getKorean_name() {
		return korean_name;
	}

	public void setKorean_name(String korean_name) {
		this.korean_name = korean_name;
	}

	public String getMarket() {
		return market;
	}

	public void setMarket(String market) {
		this.market = market;
	}

	public int getTrade_price_1() {
		return trade_price_1;
	}

	public void setTrade_price_1(int trade_price_1) {
		this.trade_price_1 = trade_price_1;
	}

	public int getTrade_price_10() {
		return trade_price_10;
	}

	public void setTrade_price_10(int trade_price_10) {
		this.trade_price_10 = trade_price_10;
	}

	public int getRaisePrice() {
		return raisePrice;
	}

	public void setRaisePrice(int raisePrice) {
		this.raisePrice = raisePrice;
	}

	@Override
	public int compareTo(UpCalResult o) {
		if (this.raiseRate > o.getRaiseRate()) {
			return -1;
		} else if (this.raiseRate <= o.getRaiseRate()) {
			return 1;
		} else
			return 0;
	}
}
