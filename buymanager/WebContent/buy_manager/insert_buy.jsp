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
<script type="text/javascript">
function check()
{
		

}
</script>
<% 
String ip=request.getParameter("page");
int p=Integer.parseInt(ip);
//int p=1;
String sql_product="select name from product";
ResultSet rs1=SCd.executeQuery(sql_product);
String sql_buyer="select name from buyer";
ResultSet rs2=SCd.executeQuery(sql_buyer);
String sql_supplier="select name from supplier";
ResultSet rs3=SCd.executeQuery(sql_supplier);
%>
  <form action="verify_insert_buy.jsp?p=<%=p %>" method="post" class="main_form">
         	<input type="hidden" name="page">
         	<input type="hidden" name="id" >
        <table id="table-4">      <tr>
                        <td>产品名称</td>
                        <td><select name="p_name">
                        <%while(rs1.next()){
                        	%>
                        	<option value="<%=rs1.getString("name")%>"><%=rs1.getString("name") %></option>
                        	<%
                        } %></select>
                        </td>
                        <td><a href="insert_product.jsp?a=1">添加新产品</a></td>
                      <tr>
                      <td>采购数量</td> 
                       <td>
                      <input type="text" name="number" id="number" />
                        </td>
                      </tr>
                       <tr>
                      <td>采购单价</td>
                      <td>
                        <input type="text" name="price" id="price"  />
                        </td></tr>
                      <tr><td>采购员姓名</td><td>  <select name="buyer_name">
                        <%while(rs2.next()){
                        	%>
                        	<option value="<%=rs2.getString("name")%>"><%=rs2.getString("name") %></option>
                        	<%
                        } %></select>
                        </td></tr>
                       <tr><td>供应商</td><td>  <select name="sup_name">
                        <%while(rs3.next()){
                        	%>
                        	<option value="<%=rs3.getString("name")%>"><%=rs3.getString("name") %></option>
                        	<%
                        } %></select>
                        </td></tr>
                  
                    <tr>
                        <input type="submit" value="保存" align="centre" />
                        
                      </tr>      
                        </table>
                    
                </form>  
</body>
</html>