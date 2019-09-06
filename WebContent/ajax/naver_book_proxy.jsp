<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page contentType="application/json; charset=utf-8"%>

<%
	String clientId = "GPUv514ODMQdYJ47ngU8";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "dbHoigZSgc";//애플리케이션 클라이언트 시크릿값";
	try {
		String text = URLEncoder.encode("자바", "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + text; // json 결과
		//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream(),"utf-8"));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer resp = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			resp.append(inputLine);
		}
		br.close();
		out.println(resp.toString());
	} catch (Exception e) {
		out.println(e);
	}
%>