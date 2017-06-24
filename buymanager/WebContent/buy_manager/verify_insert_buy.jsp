<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import ="buy.SqlConnect"%>
    <%@page import ="java.sql.*" %>
     <jsp:useBean id="SCd" scope="page" class="buy.SqlConnect" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% request.setCharacterEncoding("UTF-8");
	String ip=request.getParameter("p");
	int ipp=Integer.parseInt(ip);
	String p_name =request.getParameter("p_name");
	String n=request.getParameter("number");
	int number=Integer.parseInt(n);
	int se_num=(int)(Math.random()*1000);
	String p=request.getParameter("price");
	int price=Integer.parseInt(p);
	String buyer_name=request.getParameter("buyer_name");
	String sup_name=request.getParameter("sup_name");
	//out.print(ipp+p_name+number+price+buyer_name+sup_name);
	String sql="INSERT into buy (se_num,prod_id,number,price,buyer_id,supp_id) VALUES ( "+se_num+",(SELECT id from product where name ='"+p_name+"'),"+number+","+price+",(SELECT id from buyer where name ='"+buyer_name+"'),(select id from supplier where NAME ='"+sup_name+"'))";
	SCd.executeUpdate(sql);
	response.sendRedirect("buy_manager.jsp?page="+ipp); 
%>
</body>
</html>