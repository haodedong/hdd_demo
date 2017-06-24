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
	String name=request.getParameter("name");//
	//out.print(name);
	String n=request.getParameter("se_num");//
	int se_num=Integer.parseInt(n);
	String w=request.getParameter("weight");//
	int weight=Integer.parseInt(w);
	String type=request.getParameter("type");//
	String sup_name=request.getParameter("sup_name");//
	//out.print(name+number+price+buyer_name+address);
	String sql="update product set name='"+name+"' ,se_num="+se_num+" ,type='"+type+"',weigt="+weight+",supp_id=( select id from supplier where name='"+sup_name+"') where id="+id;
	//out.print(sql);
	SCd.executeUpdate(sql);
	response.sendRedirect("select_product.jsp?page="+ipp); 
	
	
%>
</body>
</html>