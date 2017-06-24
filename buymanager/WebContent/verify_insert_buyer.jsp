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
<%	request.setCharacterEncoding("UTF-8");
	
	//String ip=request.getParameter("page");
	String ip=request.getParameter("p");
	int ipp=Integer.parseInt(ip);
	String name =request.getParameter("name");
	String a=request.getParameter("age");
	int age=Integer.parseInt(a);
	int number=(int)(Math.random()*100);
	String sex=request.getParameter("sex");
	//out.print("id:"+id+" ipp:"+ipp+" name"+name);
 	String sql="insert into buyer (name,se_num,sex,age)  values('"+name+"',"+number+",'"+sex+"',"+age+")";
	//String sql="update buyer set name ='"+name+"',"+"age ='"+age+"' where id="+id;
	//out.print(sql);
	//ResultSet rs =SCd.executeQuery("select * from buyer");
	//rs.last();
	//int num=rs.getInt("id");
	//int number=(int)(Math.random()*100);
	SCd.executeUpdate(sql);
	response.sendRedirect("Newbuyer.jsp?page="+ipp); 
%>
</body>
</html>