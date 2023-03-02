package main.java.com.web.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class DateHelper {
	public List<String> yyyy_MM_dd_before(int cnt) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < cnt; i++) {
			if (i == 0)
				cal.add(Calendar.DATE, (cnt - 1) * -1);
			else
				cal.add(Calendar.DATE, 1);

			String date = sdf.format(cal.getTime());
			list.add(date);
		}

		return list;
	}
	
	public List<String> yyyyMMdd_before(int cnt) {		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < cnt; i++) {
			if (i == 0)
				cal.add(Calendar.DATE, (cnt - 1) * -1);
			else
				cal.add(Calendar.DATE, 1);

			String date = sdf.format(cal.getTime());
			list.add(date);
		}

		return list;
	}

	public List<String> regent_six_days() {
		List<String> before_3 = this.yyyy_MM_dd_before(3);
		List<String> after_4 = this.yyyy_MM_dd_after(5);
		int i = 0;
		for (String s : after_4) {
			if (i != 0)
				before_3.add(s);
			i++;
		}

		return after_4;
	}

	public List<String> yyyy_MM_dd_after(int cnt) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < cnt; i++) {
			if (i == 0)
				cal.add(Calendar.DATE, 0);
			else
				cal.add(Calendar.DATE, 1);

			String date = sdf.format(cal.getTime());
			list.add(date);
		}

		return list;
	}

	public int interval_minnite(String reqDateStr) throws ParseException {
		// 현재시간 Date
		Date curDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMddHHmm");
		// 요청시간을 Date로 parsing 후 time가져오기
		Date reqDate = dateFormat.parse(reqDateStr);
		long reqDateTime = reqDate.getTime();
		// 현재시간을 요청시간의 형태로 format 후 time 가져오기
		curDate = dateFormat.parse(dateFormat.format(curDate));
		long curDateTime = curDate.getTime();
		// 분으로 표현
		long minute = (curDateTime - reqDateTime) / 60000;
		return Integer.parseInt(String.valueOf(minute));
	}

	public List<String> yyyy_MM_before(int cnt) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Calendar cal = Calendar.getInstance();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < cnt; i++) {
			if (i == 0)
				cal.add(Calendar.MONTH, (cnt - 1) * -1);
			else
				cal.add(Calendar.MONTH, 1);

			String month = sdf.format(cal.getTime());
			list.add(month);
		}

		return list;
	}

	public String yyyy_MM_dd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String date = sdf.format(cal.getTime());
		return date;
	}

	public String yyyy_MM() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Calendar cal = Calendar.getInstance();
		String date = sdf.format(cal.getTime());
		return date;
	}

	public String yyyymmddhhmmss() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar cal = Calendar.getInstance();
		String strDate = sdf.format(cal.getTime());

		return strDate;
	}

	public String yyyymmddhhmmss_after_minute_now(int minute) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MINUTE, minute);
		String strDate = sdf.format(cal.getTime());

		return strDate;
	}

	public String yyyymmddhhmmss_after_minute_yyyymmddhhmmss(String yyyymmddhhmmss, int minute) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar cal = Calendar.getInstance();
		int yyyy = Integer.parseInt(yyyymmddhhmmss.substring(0, 4));
		int mm = Integer.parseInt(yyyymmddhhmmss.substring(4, 6));
		int dd = Integer.parseInt(yyyymmddhhmmss.substring(6, 8));
		int hh = Integer.parseInt(yyyymmddhhmmss.substring(8, 10));
		cal.set(yyyy, mm - 1, dd, hh, 0);
		cal.add(Calendar.MINUTE, minute);
		String strDate = sdf.format(cal.getTime());

		return strDate;
	}

	public String yyyymmdd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		String strDate = sdf.format(cal.getTime());

		return strDate;
	}

	public String getTimeArriveTime(String dt, String time, int addTime) {
		dt = dt.replaceAll("-", "");
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(dt.substring(0, 4)), Integer.parseInt(dt.substring(4, 6)) - 1,
				Integer.parseInt(dt.substring(6, 8)), Integer.parseInt(time.substring(0, 2)), 0, 0);
		cal.set(Calendar.MILLISECOND, 0);
		cal.add(Calendar.MINUTE, addTime);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String strDate = sdf.format(cal.getTime());

		return strDate;
	}

	// yyyy-mm-dd
	public String getDateDayBeta(String date) throws Exception {

		String day = "";

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date nDate = dateFormat.parse(date);

		Calendar cal = Calendar.getInstance();
		cal.setTime(nDate);

		int dayNum = cal.get(Calendar.DAY_OF_WEEK);

		switch (dayNum) {
		case 1:
			day = "ORDER_WORKTIME_SUN";
			break;
		case 2:
			day = "ORDER_WORKTIME_MON";
			break;
		case 3:
			day = "ORDER_WORKTIME_TUE";
			break;
		case 4:
			day = "ORDER_WORKTIME_WED";
			break;
		case 5:
			day = "ORDER_WORKTIME_THU";
			break;
		case 6:
			day = "ORDER_WORKTIME_FRI";
			break;
		case 7:
			day = "ORDER_WORKTIME_SAT";
			break;

		}

		return day;
	}
	
	public String getDateDay(String date){
		try {
			String day = "" ;
		     
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
		    Date nDate = dateFormat.parse(date) ;
		     
		    Calendar cal = Calendar.getInstance() ;
		    cal.setTime(nDate);
		     
		    int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
		
		    switch(dayNum){
		        case 1:
		            day = "일";
		            break ;
		        case 2:
		            day = "월";
		            break ;
		        case 3:
		            day = "화";
		            break ;
		        case 4:
		            day = "수";
		            break ;
		        case 5:
		            day = "목";
		            break ;
		        case 6:
		            day = "금";
		            break ;
		        case 7:
		            day = "토";
		            break ;
		             
		    }

		    return day ;
		} catch (Exception e) {
			return null;
		}
	    
	}
	
	public String getDateDayYmd(String date){
		try {
			String day = "" ;
		     
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd") ;
		    Date nDate = dateFormat.parse(date) ;
		     
		    Calendar cal = Calendar.getInstance() ;
		    cal.setTime(nDate);
		     
		    int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
		
		    switch(dayNum){
		        case 1:
		            day = "일";
		            break ;
		        case 2:
		            day = "월";
		            break ;
		        case 3:
		            day = "화";
		            break ;
		        case 4:
		            day = "수";
		            break ;
		        case 5:
		            day = "목";
		            break ;
		        case 6:
		            day = "금";
		            break ;
		        case 7:
		            day = "토";
		            break ;
		             
		    }

		    return day ;
		} catch (Exception e) {
			return null;
		}
	    
	}

	public String dtToOrder(String date, String time) {
		// 2019-12-16	07-08		
		return date.substring(0, 4)+"년 "+date.substring(5, 7)+"월 "+date.substring(8, 10)+"일 "+this.getDateDay(date)+"요일 "+time.substring(0, 2)+":00~"+time.substring(3, 5)+":00";
	}
}
