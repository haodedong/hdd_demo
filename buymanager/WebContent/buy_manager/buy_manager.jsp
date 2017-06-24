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
#table-4 tr:nth-child(odd) {q
background: #FFF
}
</style>  
</head>
<body>
<%--在此页面上实现采购表的增删改查   产品，数量，单价，采购员，产地--%>
 <!--Logo区域开始-->
        <div id="header">
            <img src="images/logo.png" alt="logo" class="left"/>
             <input type="button" value="增加" class="btn_add" onclick="location.href='insert_buy.jsp?page=<%=intpage %>';" />
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
      
    
    
	      	<table id="table-4">
	      	<caption>采购表管理</caption>
	      	<tr><td>产品id</td>
				<td>产品编号</td>
				<td>产品名称</td>
				<td>产品数量</td>
				<td>产品价格/个</td>
				<td>采购员姓名</td>
				<td>产品产地</td>
				<td>操作</td>
			</tr>
			<%!int intpage=1; %>
				<%
			
			 int pagesize,count,pageCount;//,intpage;//每页的记录数，总记录，总页数，当前页
			 pagesize=3;
			 String ip=request.getParameter("page");
			// String ipo=ip;
			 if(ip==null){
				 intpage=1;
			 }else{
				 intpage=Integer.parseInt(ip);
			 }
			 String sql="SELECT b.id,b.se_num,p.`name`,b.number,b.price,be.`name`,s.address from buy b,buyer be,product p,supplier s where b.buyer_id=be.id and b.prod_id=p.id and b.supp_id=s.id;";
			
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
				 int id=rs.getInt("b.id");
					int se_num=rs.getInt("b.se_num");
					String name=rs.getString("p.name");
					int number=rs.getInt("b.number");
					double price=rs.getDouble("b.price");
					String buyername=rs.getString("be.name");
					String address=rs.getString("s.address");
					
				%>
				
					<tr><td><%=id %></td>
						<td><%=se_num %></td>
						<td><%=name %></td>
						<td><%=number %></td>
						<td><%=price %></td>
						<td><%=buyername %></td>
						<td><%=address%></td>
						
						<td><a href="edit_buy.jsp?id=<%=id %>&ip=<%=ip%>">修改</a>
						 
						<a href="delete_buy.jsp?id=<%=id %>&ip=<%=ip%>">删除 </a> </td>
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
				 <a href="buy_manager.jsp?page=<%=intpage-1%>">上一页</a>
				<%  }
				if(intpage<pageCount){
			%>
			<a href="buy_manager.jsp?page=<%=intpage+1%>">下一页</a>
			<% 		
				}
		
			
		%> </div> 
        <div id="footer">
            <p>[源自坠落的翅膀]</p>
            <p>版权所有(C)沈阳化工大学</p>
        </div>
</body>
</html>