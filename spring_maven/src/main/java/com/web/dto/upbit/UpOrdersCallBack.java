package main.java.com.web.dto.upbit;

public class UpOrdersCallBack {
	private String uuid;
	private String side;
	private String ord_type;
	private String price;
	private String state;
	private String market;
	private String created_at;
	private String volume;
	private String remaining_volume;
	private String reserved_fee;
	private String remaining_fee;
	private String paid_fee;
	private String locked;
	private String executed_volume;
	private int trades_count;

	private int buyed_price;
	private int buyed_total;
	private int saled_price;
	private int saled_total;

	private String access_key;
	private String secret_key;
	private String name;
	private String buyed;

	public String getBuyed() {
		return buyed;
	}

	public void setBuyed(String buyed) {
		this.buyed = buyed;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBuyed_price() {
		return buyed_price;
	}

	public void setBuyed_price(int buyed_price) {
		this.buyed_price = buyed_price;
	}

	public int getBuyed_total() {
		return buyed_total;
	}

	public void setBuyed_total(int buyed_total) {
		this.buyed_total = buyed_total;
	}

	public int getSaled_price() {
		return saled_price;
	}

	public void setSaled_price(int saled_price) {
		this.saled_price = saled_price;
	}

	public int getSaled_total() {
		return saled_total;
	}

	public void setSaled_total(int saled_total) {
		this.saled_total = saled_total;
	}

	private UpOrdersError error;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getSide() {
		return side;
	}

	public void setSide(String side) {
		this.side = side;
	}

	public String getOrd_type() {
		return ord_type;
	}

	public void setOrd_type(String ord_type) {
		this.ord_type = ord_type;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getMarket() {
		return market;
	}

	public void setMarket(String market) {
		this.market = market;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getRemaining_volume() {
		return remaining_volume;
	}

	public void setRemaining_volume(String remaining_volume) {
		this.remaining_volume = remaining_volume;
	}

	public String getReserved_fee() {
		return reserved_fee;
	}

	public void setReserved_fee(String reserved_fee) {
		this.reserved_fee = reserved_fee;
	}

	public String getRemaining_fee() {
		return remaining_fee;
	}

	public void setRemaining_fee(String remaining_fee) {
		this.remaining_fee = remaining_fee;
	}

	public String getPaid_fee() {
		return paid_fee;
	}

	public void setPaid_fee(String paid_fee) {
		this.paid_fee = paid_fee;
	}

	public String getLocked() {
		return locked;
	}

	public void setLocked(String locked) {
		this.locked = locked;
	}

	public String getExecuted_volume() {
		return executed_volume;
	}

	public void setExecuted_volume(String executed_volume) {
		this.executed_volume = executed_volume;
	}

	public int getTrades_count() {
		return trades_count;
	}

	public void setTrades_count(int trades_count) {
		this.trades_count = trades_count;
	}

	public UpOrdersError getError() {
		return error;
	}

	public void setError(UpOrdersError error) {
		this.error = error;
	}

}
