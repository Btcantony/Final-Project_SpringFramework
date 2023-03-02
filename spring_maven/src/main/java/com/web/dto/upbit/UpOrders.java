package main.java.com.web.dto.upbit;

import java.util.List;

public class UpOrders {
	private String market;
	private String side;
	private String volume;
	private String price;
	private String ord_type;

	private String uuid;
	private String state;

	private List<String> uuids;

	public List<String> getUuids() {
		return uuids;
	}

	public void setUuids(List<String> uuids) {
		this.uuids = uuids;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getMarket() {
		return market;
	}

	public void setMarket(String market) {
		this.market = market;
	}

	public String getSide() {
		return side;
	}

	public void setSide(String side) {
		this.side = side;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getOrd_type() {
		return ord_type;
	}

	public void setOrd_type(String ord_type) {
		this.ord_type = ord_type;
	}

}
