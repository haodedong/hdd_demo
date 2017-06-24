<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
    <%@page import ="采集信息管理系统.SqlConnect"%>
    <%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="SC" scope="page" class="采集信息管理系统.SqlConnect" />
</head>
<body>

<%
	String user=request.getParameter("user");
	String password=request.getParameter("password");
	 String rcode=(String)session.getAttribute("rCode");
	String code=request.getParameter("code");
	 if(user=="")
	{
		out.print("<script language='javascript'>alert('账号部位空');history.back();</script>");
	}
	 else if(password=="")
	{
		out.print("<script language='javascript'>alert('密码部位空');history.back();</script>");
	}
	 else if(!rcode.equals(code))
	{
		//if(code=="")
		out.print("<script language='javascript'>alert('验证码错误');history.back();</script>");
	} 
	else{
		/*if(rcode.equals(code))
	}
	{
		if(code=="")
		{
			out.print("<script language='javascript'>alert('验证码错误');history.back();</script>");
		}
	}
	else {
		out.print("<script language='javascript'>alert('验证码错误');history.back();</script>");
	}  */
try{

String sql= "select * from admin where user='" + user+ "' and password='"+ password + "'";
ResultSet rs =SC.executeQuery(sql);
if(rs.next()){
session.setAttribute("xingming",rs.getString("user"));
response.sendRedirect("index.jsp");
rs.close();
}else{ 
out.print("<script language='javascript'>alert('用户名或密码不对');history.back();</script>");
out.close();	
}
}catch(Exception e){
		
	}
	}
%>
</body>
</html>