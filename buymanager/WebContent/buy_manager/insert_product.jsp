<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@page import ="buy.SqlConnect"%>
    <%@page import ="java.sql.*" %>
     <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
       <jsp:useBean id="SCd" scope="page" class="buy.SqlConnect" />
        <style type="text/css">
        /* Border styles */
#table-4 thead, #table-4 tr {
border-top-width: 1px;
border-top-style: solid;
border-top-color: rgb(211, 202, 221);
}
#table-4 {
border-bottom-width: 1px;
border-bottom-style: solid;
border-bottom-color: rgb(211, 202, 221);
}

/* Padding and font style */
#table-4 td, #table-4 th {
padding: 5px 10px;
font-size: 16px;
font-family: Verdana;
color: rgb(95, 74, 121);
}

/* Alternating background colors */
#table-4 tr:nth-child(even) {
background: rgb(223, 216, 232)
}
#table-4 tr:nth-child(odd) {
background: #FFF
}
</style>
</head>
<body>
<%String sql_supplier="select name from supplier";
ResultSet rs3=SCd.executeQuery(sql_supplier);
String aa=request.getParameter("a");
int a=Integer.parseInt(aa);
 %>
<form action="verify_insert_product.jsp?a=<%=a %>" method="post" class="main_form">
<table id="table-4">
<
<tr>
<td>
请输入产品名称</td><td> <input type="text" name ="name"/></td></tr>
<tr><td>请确定产品大小（大，中，小）</td><td> <input type="text" name ="type"/></td></tr>
<tr><td>请输入产品质量</td><td> <input type="text" name ="weigt"/></td></tr>
 <tr><td>请选择供应商</td><td>  <select name="sup_name">
                        <%while(rs3.next()){
                        	%>
                        	<option value="<%=rs3.getString("name")%>"><%=rs3.getString("name") %></option>
                        	<%
                        } %></select>
                        </td></tr>
                        <td><input type="submit" value="确定" align="center" ></td>
</table>
</form>
</body>
</html>