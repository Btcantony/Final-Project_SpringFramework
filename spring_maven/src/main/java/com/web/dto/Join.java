package main.java.com.web.dto;

public class Join {
	private String email;
	private String password;
	private String nick_name;
	private String phone_num;
	private String image_url; //카카오톡으로 시작하기로 하면 카톡프로필 이미지불러오기 위해서
	
	// ext 파라미터
	private int user_count;
	private String type;
	
	private String emails;
	
	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}



	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	
	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public int getUser_count() {
		return user_count;
	}

	public void setUser_count(int user_count) {
		this.user_count = user_count;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getEmails() {
		return emails;
	}

	public void setEmails(String emails) {
		this.emails = emails;
	}

	
}
