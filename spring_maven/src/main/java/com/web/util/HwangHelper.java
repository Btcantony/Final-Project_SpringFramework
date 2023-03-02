package main.java.com.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import main.java.com.web.dto.Join;

public class HwangHelper {
	// 세션을 가지고 온다.
	public Join getSession(HttpServletRequest req) {
		HttpSession session = req.getSession();
		return (Join)session.getAttribute("join");
	}
	
	// 세션을 넣는다
	public void setSession(HttpServletRequest req, Join join) {
		HttpSession session = req.getSession();
		session.setAttribute("join", join);
	}
}
