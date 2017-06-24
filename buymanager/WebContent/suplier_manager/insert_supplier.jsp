<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
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
	request.setCharacterEncoding("UTF-8");
%>
		<form action="../Verify_insert_supplier_Servlet" method="post">
	<table id="table-4">
	
		<!-- <tr>
			<td>编号
			</td>
			<td><input type="text" name="se_num">
			</td>
		</tr> -->
		<tr>
			<td>供应商名称
			</td>
			<td><input type="text" name="name" >
			</td>
		</tr>
		<tr>
			<td>供应商地址
			</td>
			<td><input type="text" name="address" >
			</td>
		</tr>
		<tr>
			<td>供应商电话
			</td>
			<td><input type="text" name="telephone" >
			</td>
		</tr>	
		<tr>
		<td>
		<input type="submit" value="保存">
		</td>
		</tr>
	</table>
	</form>
</body>
</html>