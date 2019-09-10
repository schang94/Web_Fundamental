<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page contentType="application/json;charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String key = request.getParameter("key");
	String value = request.getParameter("value");
	String clientId = "a1RQlx9O4lTGUkF4g0MA";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "ABs7bJKCqG";//애플리케이션 클라이언트 시크릿값";
	try {
	    String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
	    String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code +"&key="+ key + "&value="+ value;
	
	    URL url = new URL(apiURL);
	    HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    con.setRequestMethod("GET");
	    con.setRequestProperty("X-Naver-Client-Id", clientId);
	    con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	    int responseCode = con.getResponseCode();
	    BufferedReader br;
	    if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    } else {  // 에러 발생
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
	    System.out.println(e);
	}
%>