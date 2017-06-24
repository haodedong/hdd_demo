<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import ="buy.SqlConnect"%>
    <%@page import ="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <jsp:useBean id="SCd" scope="page" class="buy.SqlConnect" />
</head>
<body>
<% request.setCharacterEncoding("UTF-8");
	String ID=request.getParameter("id");
	int id=Integer.parseInt(ID);
	String ip=request.getParameter("page");
	int ipp=Integer.parseInt(ip);
	//request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	//out.print(name);
	String n=request.getParameter("number");
	int number=Integer.parseInt(n);
	String p=request.getParameter("price");
	int price=Integer.parseInt(p);
	String buyer_name=request.getParameter("buyer_name");
	String address=request.getParameter("address");
	//out.print(name+number+price+buyer_name+address);
	String sql="UPDATE  buy b,buyer be,product p,supplier s set p.`name`='"+name+"',b.number="+number+",b.price="+price+",be.`name`='"+buyer_name+"',s.address='"+address+"'  where b.buyer_id=be.id and b.prod_id=p.id and b.supp_id=s.id and b.id="+id;
	//out.print(sql);
	SCd.executeUpdate(sql);
	response.sendRedirect("buy_manager.jsp?page="+ipp); 
	
	
%>
</body>
</html>