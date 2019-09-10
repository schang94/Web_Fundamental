package kr.co.kic.dev1.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Utility {
	public static String getConvert (String msg) {
		msg = msg.replaceAll(">","&gt;").replaceAll("<","&lt;").replace("\n", "<br>");
		
		return msg;
	}
	public static String getKoreaDate(String date) { // Jan 13, 2019
		String koreaDate = null;
		SimpleDateFormat from = new SimpleDateFormat("MMM dd, yyyy",Locale.US);
		SimpleDateFormat to = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
		
		try {
			Date d = from.parse(date); // date => Aug 05, 2019
			koreaDate = to.format(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return koreaDate; // 2019-08-06
	}
}
