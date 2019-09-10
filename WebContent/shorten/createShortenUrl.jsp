<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page contentType="application/json;charset=UTF-8"%>
<%
	String clientId = "WFrCUvZIS4h_aVsYC84g";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "RL3rQx95KX";//애플리케이션 클라이언트 시크릿값";
	String getUrl = request.getParameter("url");
	
	StringBuffer resp = new StringBuffer();
	try {
	    String text = getUrl;
	    String apiURL = "https://openapi.naver.com/v1/util/shorturl?url=" + text;
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
	    while ((inputLine = br.readLine()) != null) {
	        resp.append(inputLine+"\n");
	    }
	    br.close();
	    
	    %>{ "shortUrl" : <%=resp.toString()%> }<%

	} catch (Exception e) {
	    System.out.println(e);
	}
%>