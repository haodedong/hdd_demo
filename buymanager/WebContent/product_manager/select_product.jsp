<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<div id="header">
            <img src="images/logo.png" alt="logo" class="left"/>
             <input type="button" value="增加" class="btn_add" onclick="location.href='../buy_manager/insert_product.jsp?a=2';" />
            <a href="login.jsp">[退出]</a>            
        </div>
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
	<table id="table-4">
	      	<caption>产品管理</caption>
	      	<tr><td>id</td>
				<td>编号</td>
				<td>产品名称</td>
				<td>产品类型</td>
				<td>产品重量</td>
				<td>产品产地</td>
				<td>业务</td>
			</tr>
			<%!int intpage=1; %>
				<%
			
			 int pagesize,count,pageCount;//,intpage;//每页的记录数，总记录，总页数，当前页
			 pagesize=3;
			 String ip=request.getParameter("page");
			 
			 if(ip==null){
				 intpage=1;
			 }else{
				 intpage=Integer.parseInt(ip);
			 }
			 String sql="select * from select_product";
			
			 ResultSet rs=SCd.executeQuery(sql);
			 rs.last();
			 count=rs.getRow();
			 pageCount=(count+pagesize-1)/pagesize;
			 if(intpage>count){
				 intpage=count;
			 }
			 if(count>0){
				 rs.absolute((intpage-1)*pagesize+1);
			 }
			 int i=0;
			 while(i<pagesize&&!rs.isAfterLast()){
				 int id=rs.getInt("id");
					int se_num=rs.getInt("se_num");
					String name=rs.getString("name");
					String type=rs.getString("type");
					int weight=rs.getInt("weigt");
					String address=rs.getString("address");
				%>
				
					<tr><td><%=id %></td>
						<td><%=se_num %></td>
						<td><%=name %></td>
						<td><%=type%></td>
						<td><%=weight%></td>
						<td><%=address %></td>
						<td><a href="edit_product.jsp?id=<%=id %>&ip=<%=intpage%>">修改</a>
						 
						<a href="delete_product.jsp?id=<%=id %>&ip=<%=intpage%>">删除 </a> </td>
						</tr>
			<%  
			 rs.next();
			 i++;
			 }
			rs.close();
				%>
				 </table>
				 <div align ="center">
				 共<%=count %>条记录，分<%=pageCount %>页显示，当前是第<%=intpage %>页
				 <%
				 if(intpage>1){
					 %>
				 <a href="select_product.jsp?page=<%=intpage-1%>">上一页</a>
				<%  }
				if(intpage<pageCount){
			%>
			<a href="select_product.jsp?page=<%=intpage+1%>">下一页</a>
			<% 		
				}
		
			
		%>
</body>
</html>