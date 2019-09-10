<%@page import="java.util.Calendar"%>
<%@page import="java.io.IOException"%>
<%@page import="com.google.zxing.WriterException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@ page contentType="application/json;charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String url = request.getParameter("url");
	
	
	QRCodeWriter writer = new QRCodeWriter();
	try {
		BitMatrix qrCode = writer.encode(url, BarcodeFormat.QR_CODE, 300, 300);
		BufferedImage  qrIamge = MatrixToImageWriter.toBufferedImage(qrCode);
		
		String path = request.getRealPath("/upload/files");
		
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		
		path += "/"+year+"/"+month;
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		long currentMills = System.currentTimeMillis();
		File f2 = new File(f,currentMills+".png");
		boolean isSuccess = ImageIO.write(qrIamge, "PNG", f2);
		
		if(isSuccess){%>
			{"result" : "ok", "path" : "/upload/files/<%=year%>/<%=month%>/<%=currentMills%>.png" }
		<% } else { %>
			{"result" : "fail" }
		<% }
	} catch (WriterException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch(IOException e) {
		
	}
%>