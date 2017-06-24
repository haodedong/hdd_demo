<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import ="buy.SqlConnect"%>
    <%@page import ="java.sql.*" %>
    
    
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" />  
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
        <!--Logo区域开始-->
        <div id="header">
            <img src="images/logo.png" alt="logo" class="left"/>
             <input type="button" value="增加" class="btn_add" onclick="location.href='insert_buyer.jsp?page=<%=intpage+1 %>';" />
            <a href="login.jsp">[退出]</a>            
        </div>
       
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="index.jsp" class="index_off"></a></li>
                <li><a href="../role/role_list.html" class="role_off"></a></li>
               <!-- 不要再跳到自己的页面了，*****会把url的值搞丢了 <li><a href="Newbuyer.jsp?" class="admin_on"></a></li> -->
                <li><a href="../fee/fee_list.html" class="fee_off"></a></li>
                <li><a href="../account/account_list.html" class="account_off"></a></li>
                <li><a href="../service/service_list.html" class="service_off"></a></li>
                <li><a href="../bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="../report/report_list.html" class="report_off"></a></li>
                <li><a href="../user/user_info.html" class="information_off"></a></li>
                <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>            
        </div>
        
        <!--主要区域结束-->
       <font size=3 color="red" align="center">采购员管理</font>
    
    
	      	<table id="table-4">
	      	<caption>采购员管理</caption>
	      	<tr><td>id</td>
				<td>编号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>年龄</td>
				<td>操作</td>
			</tr>
			<%!int intpage; %>
				<%
			
			 int pagesize,count,pageCount;//,intpage;//每页的记录数，总记录，总页数，当前页
			 pagesize=3;
			 String ip=request.getParameter("page");
			 
			 if(ip==null){
				 intpage=1;
			 }else{
				 intpage=Integer.parseInt(ip);
			 }
			 String sql="select * from buyer";
			
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
					String sex=rs.getString("sex");
					int age=rs.getInt("age");
				%>
				
					<tr><td><%=id %></td>
						<td><%=se_num %></td>
						<td><%=name %></td>
						<td><%=sex %></td>
						<td><%=age %></td>
						<td><a href="edit_buyer.jsp?id=<%=id %>&ip=<%=ip%>">修改</a>
						 
						<a href="delete_buyer.jsp?id=<%=id %>&ip=<%=ip%>">删除 </a> </td>
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
				 <a href="Newbuyer.jsp?page=<%=intpage-1%>">上一页</a>
				<%  }
				if(intpage<pageCount){
			%>
			<a href="Newbuyer.jsp?page=<%=intpage+1%>">下一页</a>
			<% 		
				}
		
			
		%> </div> 
        <div id="footer">
            <p>[源自坠落的翅膀]</p>
            <p>版权所有(C)沈阳化工大学</p>
        </div>
    </body>
</html>
