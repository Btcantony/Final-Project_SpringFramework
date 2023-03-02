package main.java.com.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import main.java.com.web.dto.Admin;
import main.java.com.web.dto.upbit.UpbitUser;

public class DevHelper {
	// 세션을 가지고 온다.
	public Object getSession(HttpServletRequest request, String sessionName) {
		HttpSession session = request.getSession();
		return session.getAttribute(sessionName);
	}
	
	// 세션을 넣는다
	public void setSession(HttpServletRequest request, Object object, String sessionName) {
		HttpSession session = request.getSession();
		session.setAttribute(sessionName, object);
	}
}
