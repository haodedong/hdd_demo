<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function checked()
{
	   
	 var name=document.getElementById("buyer_name").value;
	 if(name.length>4)
		 alert('太长了');	
}
</script>
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
<%--fighting --%>
<body>
<%String sql_supplier="select name from supplier";
ResultSet rs3=SCd.executeQuery(sql_supplier);
 %>
	<%
	request.setCharacterEncoding("UTF-8");
	String ip=request.getParameter("ip");
	int ipp=Integer.parseInt(ip);
	String ID=request.getParameter("id");
	int id=Integer.parseInt(ID);
	String sql1="select * from select_product where id="+id;
	String sql2="UPDATE  buy b,buyer be,product p,supplier s set p.`name`='jjj',b.number=10,b.price=10,be.`name`='jjj',s.address='jjjj'  where b.buyer_id=be.id and b.prod_id=p.id and b.supp_id=s.id and b.id= "+id;
	ResultSet rs =SCd.executeQuery(sql1);
	rs.next();
	//String name=rs.getString("p.name");
	//out.print(name);
	%>
  <form action="verify_edit_product.jsp" method="post" class="main_form">
         	<input type="hidden" name="page" value="<%=ipp%>">
         	<input type="hidden" name="id" value="<%=id%>">
                  <table id="table-4">
                      
                       
                      <tr> 
                      <td>产品编号</td><td> <input type="text" name="se_num" id="se_num" value="<%=rs.getInt("se_num") %>"  />
                      </td></tr>
                       <tr>
                      <td>产品名称</td>
                      <td>
                       <input type="text" name="name" value="<%=rs.getString("name") %>"  />
                      </td></tr>
                      <tr><td>产品类型</td><td> <input type="text" name="type" id="type"value="<%=rs.getString("type") %>" onblur="checked()" />
                       </td></tr>
                       <tr><td>产品重量 </td><td><input type="text" name="weight" value="<%=rs.getString("weigt") %>"  />
                      </td>
                      </tr>
                      <tr><td>请选择供应商</td><td>  <select name="sup_name">
                        <%while(rs3.next()){
                        	%>
                        	<option value="<%=rs3.getString("name")%>"><%=rs3.getString("name") %></option>
                        	<%
                        } %></select>
                        </td></tr>
                  
                    <tr>
                        <input type="submit" value="保存" align="centre" />
                      </tr></table>  
                     
                </form>   
</body>
</html>