package main.java.com.web.util;

public class UpbitHelper {
	public int Sum(String a, String b) {
		return (int)Double.parseDouble(a) * (int)Double.parseDouble(b);
	}
	
	public int Sum(double a, String b) {
		return (int)Double.parseDouble(b) * (int)a;
	}
}
