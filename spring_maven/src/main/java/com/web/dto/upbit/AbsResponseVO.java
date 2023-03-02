package main.java.com.web.dto.upbit;

abstract class AbsResponseVO {
	private String code; // 0000, 9999
	private String msg; // success, fail

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public abstract void success();

	public abstract void success(String code, String msg);

	public abstract void fail(String code, String msg);
}
