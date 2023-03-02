package main.java.com.web.dto.upbit;

import java.util.List;

public class Upbit extends AbsResponseVO {

	private UpbitUser upbitUser;

	private List<UpbitMarket> upbitMarkets;
	private List<UpbitTicker> upbitTickers;

	public List<UpbitTicker> getUpbitTickers() {
		return upbitTickers;
	}

	public void setUpbitTickers(List<UpbitTicker> upbitTickers) {
		this.upbitTickers = upbitTickers;
	}

	public List<UpbitMarket> getUpbitMarkets() {
		return upbitMarkets;
	}

	public void setUpbitMarkets(List<UpbitMarket> upbitMarkets) {
		this.upbitMarkets = upbitMarkets;
	}

	public UpbitUser getUpbitUser() {
		return upbitUser;
	}

	public void setUpbitUser(UpbitUser upbitUser) {
		this.upbitUser = upbitUser;
	}

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
