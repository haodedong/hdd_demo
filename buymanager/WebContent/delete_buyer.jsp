<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import ="buy.SqlConnect"%>
    <%@page import ="java.sql.*" %>
     <jsp:useBean id="SCd" scope="page" class="buy.SqlConnect" />
<title>Insert title here</title>
</head>
<body>
<%
	String ip=request.getParameter("ip");
	int ipp=Integer.parseInt(ip);
	String ID=request.getParameter("id");
	int id=Integer.parseInt(ID);
	String sql="delete from buyer where id ="+id;
	out.print(sql);
	boolean s=SCd.executeUpdate(sql);
	/*  if(s)
	{
		out.print("<script language='javascript'> alert('删除成功');</script>");
	}	else	
	{
		out.print("<script language='javascript'>alert('删除失败');</script>");
	}   */
	response.sendRedirect("Newbuyer.jsp?page="+ipp);
%>
</body>
</html>