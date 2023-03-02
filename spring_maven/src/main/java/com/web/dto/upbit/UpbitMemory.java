package main.java.com.web.dto.upbit;

import java.util.ArrayList;
import java.util.List;

public class UpbitMemory {
	public static boolean Reset = false;
	public static boolean UpbitRunning = true;	
	public static int UpbitStartCalNum = 0;
	public static List<UpbitUser> UpbitUsers = new ArrayList<UpbitUser>();
	public static List<UpbitMarket> UpbitMarkets = new ArrayList<UpbitMarket>();
	public static List<UpbitTicker> UpbitTickers = new ArrayList<UpbitTicker>();
	public static List<UpbitTicker> UpbitTickersFirst = new ArrayList<UpbitTicker>();
}
