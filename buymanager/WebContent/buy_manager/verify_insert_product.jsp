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
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	//out.print(name);
	String aa=request.getParameter("a");
	int a=Integer.parseInt(aa);
	String type=request.getParameter("type");
	String weight=request.getParameter("weigt");
	String sup_name=request.getParameter("sup_name");
	int number=(int)(Math.random()*100);
    String sql="INSERT into product (se_num,name,type,weigt,supp_id) values("+number+",'"+name+"','"+type+"',"+weight+",(select id from supplier where name='"+sup_name+"'))";
	//out.print(sql);
     SCd.executeUpdate(sql);
     if(a==1)
	  {
    	 response.sendRedirect("insert_buy.jsp?page=1");
	  }
     else
    	 response.sendRedirect("../product_manager/select_product.jsp"); 
%>
<script type="text/javascript">
//history.go(-2); 
</script>
</body>
</html>