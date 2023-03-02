package main.java.com.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import main.java.com.web.dto.Admin;
import main.java.com.web.dto.Join;
import main.java.com.web.dto.upbit.UpbitUser;
import main.java.com.web.util.DevHelper;
 
// 로그인처리를 담당하는 인터셉터
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
 
    // preHandle() : 컨트롤러보다 먼저 수행되는 메서드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	// 세션 정보
    	HttpSession session = request.getSession();
		Join join = (Join)session.getAttribute("join");
    	
    	//System.out.println("AuthenticationInterceptor.....");    	
    	String path = request.getServletPath();    	
    	if(path.contains("/resources/")) {
    		return true;
    	} 
    			
    	//System.out.println("preHandle Url : " + request.getServletPath());
		if(path.equals("/main/buy") || path.equals("/main/regist_notice")) { // 구매 페이지
    		if(join == null) {
    			response.sendRedirect("/login/log");
    	        return false;
    		}
    	}
    	    	
    	if(path.equals("/main1/buy") || path.equals("/main1/regist_notice")) { // 구매 페이지
    		if(join == null) {
    			response.sendRedirect("/login1/log");
    	        return false;
    		}
    	}
    	
    	if(path.equals("/main2/buy") || path.equals("/main2/regist_notice")) { // 구매 페이지
    		if(join == null) {
    			response.sendRedirect("/login2/log");
    	        return false;
    		}
    	}
    	
    	
    	if(path.equals("/main3/buy") || path.equals("/main3/regist_notice")) { // 구매 페이지
    		if(join == null) {
    			response.sendRedirect("/login3/log");
    	        return false;
    		}
    	}
    	
    	
    	
    	
    	if(path.equals("/login1/myprofile") || path.equals("/login1/mywish")) { // 마이페이지 및 관심상품 접근 시
    		if(join == null) {
    			response.sendRedirect("/login1/log");
    	        return false;
    		}
    	}
    	
    	if(path.equals("/login2/myprofile")) { // 배송지
    		if(join == null) {
    			response.sendRedirect("/login2/log");
    	        return false;
    		}
    	}
    	
    	
    	
    	//if(request.getServletPath().equals("/login")) return true; // 로그인 화면이동
    	//if(request.getServletPath().equals("/sample")) return true; // 로그인이면 테스트 호출   	
    	//if(request.getServletPath().contains("/resources")) return true; // 정적자원 호출 OK    	 
    	
        // session 객체를 가져옴
        //HttpSession session = request.getSession();
        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
        //Object obj = session.getAttribute("adminVO");
         
        //if ( obj == null ){
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
        //   response.sendRedirect("/cleanlaundry/login");
        //    return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        //}
         
        // preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
    	
    	if(path.contains("/admin")){ // 관리자 메인 컨트롤러 접근
    		if(path.equals("/admin/login")){ // 로그인   
    			return true;
    		}
    		if(path.contains("/admin/ajax")){ // 비동기 처리   
    			return true;
    		}
    		// 로그인이 안되어 있으면
    		session = request.getSession();
    		Admin admin = (Admin)session.getAttribute("admin");
    		
    		// 로그인 페이지로 가세요
    		if(admin == null) {
    			if(path.equals("/admin/fileUpload")){ // 파일 업로드 함수는 세션과 무관하게 사용자 화면과 같이 사용
        			return true;
        		}
    			
    			response.sendRedirect("/admin/login");
    	        return false;
    		}    		
    	}
    	
    	if(path.contains("/upbit")){ // 관리자 메인 컨트롤러 접근
    		if(path.equals("/upbit/login")){ // 로그인   
    			return true;
    		}
    		if(path.contains("/upbit/ajax")){ // 비동기 처리   
    			return true;
    		}
    		// 로그인이 안되어 있으면
    		DevHelper dev = new DevHelper();    		
    		UpbitUser upbitUser = (UpbitUser)dev.getSession(request, "upbitUser");
    		
    		// 로그인 페이지로 가세요
    		if(upbitUser == null) {
    			if(path.equals("/upbit/fileUpload")){ // 파일 업로드 함수는 세션과 무관하게 사용자 화면과 같이 사용
        			return true;
        		}
    			
    			response.sendRedirect("/upbit/login");
    	        return false;
    		}    		
    	}
        return true;
        

        
        
        
    }
 
    // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {    	
        super.postHandle(request, response, handler, modelAndView);
    }
     
}
