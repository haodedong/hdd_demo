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
<%
	String ip=request.getParameter("ip");
	int ipp=Integer.parseInt(ip);
	String ID=request.getParameter("id");
	int id=Integer.parseInt(ID);
	//SELECT b.id,b.se_num,p.`name`,b.number,b.price,be.`name`,s.address from buy b,buyer be,product p,supplier s where b.buyer_id=be.id and b.prod_id=p.id and b.supp_id=s.id;"
	//String sql="delete  from buy b,buyer be,product p,supplier s where b.buyer_id=be.id and b.prod_id=p.id and b.supp_id=s.id and b.id ="+id;
	String sql="delete from buy where id="+id;
	boolean s=SCd.executeUpdate(sql);
	//out.print(sql);
	response.sendRedirect("buy_manager.jsp?page="+ipp);
%>
</body>
</html>