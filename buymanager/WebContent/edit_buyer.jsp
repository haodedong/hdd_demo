<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import ="buy.SqlConnect"%>
    <%@page import ="java.sql.*" %>
     <jsp:useBean id="SCd" scope="page" class="buy.SqlConnect" />
     
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" />  
</head>
<body>
	 <script language="javascript" type="text/javascript">
            //保存成功的提示消息
            function showResult() {
             
            }
           function checkid(){
        	   
        	 var name=document.getElementById("name").value;
        	 if(name.length>4)
        		 alert('太长了');
           }
           function checkage(){
        	   var age=document.getElementById("age").value;
        	   if(age>60)
        		   {
        		   		alert('该退休啦！！');
        		   }
        	   else if(age<18){
        		   alert('禁止雇佣童工')
        	   }
        	    
           }
        </script>
	  <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
         <div id="navi">
            <ul id="menu">
                <li><a href="index.html" class="index_off"></a></li>
                <li><a href="../role/role_list.html" class="role_off"></a></li>
                <li><a href="Newbuyer.jsp" class="admin_on"></a></li><!--  -->
                <li><a href="../fee/fee_list.html" class="fee_off"></a></li>
                <li><a href="../account/account_list.html" class="account_off"></a></li>
                <li><a href="../service/service_list.html" class="service_off"></a></li>
                <li><a href="../bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="../report/report_list.html" class="report_off"></a></li>
                <li><a href="../user/user_info.html" class="information_off"></a></li>
                <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>
        </div>
        <%
        String ip=request.getParameter("ip");
    	int ipp=Integer.parseInt(ip);
    	String ID=request.getParameter("id");
    	int id=Integer.parseInt(ID);
    	String sql1="select * from buyer where id= "+id;
    	ResultSet rs =SCd.executeQuery(sql1);
    	rs.next();
    	String name=rs.getString("name");
        %>
         <form action="verify_edit_buyer.jsp" method="post" class="main_form">
         	<input type="hidden" name="page" value="<%=ipp%>">
         	<input type="hidden" name="id" value="<%=id%>">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" name="name" id="name"value="<%=name %>" onblur="checkid()" />
                        <span class="required">*</span>
                        <div class="validate_msg_long error_msg">20长度以内的汉字、字母、数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <div class="input_info"><input type="radio" class="readonly" name="sex" value="男" checked>男</input> 
                    						<input type="radio" class="readonly" name="sex" value="女" >女</input>
                    </div>
                    <div class="text_info clearfix"><span>年龄：</span></div>
                    <div class="input_info">
                        <input type="text"  name="age" value="<%=rs.getInt("age") %>" id="age"onblur="checkage()" />
                        <span class="required">*</span>
                        
                     
                  
                    <div class="button_info clearfix">
                        <input type="submit" value="保存" class="btn_save" />
                        
                    </div>
                </form>  
       
</body>
</html>