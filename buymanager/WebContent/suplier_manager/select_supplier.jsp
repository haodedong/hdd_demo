<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
    <%@page import="supplier.Supplier"%>
    <%@page import ="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" />
<head>

<div id="header">
            <img src="images/logo.png" alt="logo" class="left"/>
            <!-- 这是怎么回事，为什么路径不对 -->
             <input type="button" value="增加" class="btn_add" onclick="location.href='/采集信息管理系统/suplier_manager/insert_supplier.jsp';" />
            <a href="login.jsp">[退出]</a>            
        </div>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<%
//int page=request.getAttribute("jj");
List<Supplier> list= new ArrayList<>();
list=(List<Supplier>)application.getAttribute("list");

%>
<table id="table-4">
<tr>
<td>
编号</td><td>名称</td><td>地址</td><td>电话</td><td>业务</td></tr>
<% int intpage=(int)application.getAttribute("intpage");
int num=-1;
	for(Supplier  s: list){
		num++;
		//application.setAttribute("num",num);
	%>
	
	<tr>
	<td>
	
	<%=s.getSe_nm()%></td>
	<td><%=s.getName() %></td>
	<td><%=s.getAddress() %></td>
	<td><%=s.getTelephone() %></td>
<%--	<td><a href="/采集信息管理系统/suplier_manager/Edit_supplier.jsp?id=<%=s.getId() %>&ip=<%=intpage%>">修改</a>--%><%--为什么一定要这么写，别的程序怎么不用？？？ --%>>
		<td><a href="Edit_supplier_Servlet?id=<%=s.getId() %>&ip=<%=intpage%>&num=<%=num%>">修改</a>
		<a href="Delete_supplier_Servlet?id=<%=s.getId() %>&ip=<%=intpage%>">删除 </a>
		 </td>
	<% }
%>
</table>
		 <div align ="center">
		 <%int count=(int)application.getAttribute("count");
 		 int pageCount=(int)application.getAttribute("pageCount");
		 //	int intpage=(int)request.getAttribute("intpage");
		 %>
				 共<%=count %>条记录，分<%=pageCount%>页显示，当前是第<%=intpage %>页
				 <%
				 if(intpage>1){
					 %>
				 <a href="NewServlet?page=<%=intpage-1%>">上一页</a>
				<%  }
				if(intpage<pageCount){
			%>
			<a href="NewServlet?page=<%=intpage+1%>">下一页</a>
			<% 		
				}
		
			
		%> 
</body>
</html>