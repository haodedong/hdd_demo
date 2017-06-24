<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" /> 
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
<%
String ip=request.getParameter("page");
int p=Integer.parseInt(ip);
%>
  <form action="verify_insert_buyer.jsp?p=<%=p %>" method="post" class="main_form">
         	<input type="hidden" name="page">
         	<input type="hidden" name="id" >
         	<table id="table-4">
                  <tr><td>  <div class="text_info clearfix"><span>姓名：</span></div></td>
                    <div class="input_info">
                    <td>    <input type="text" name="name" id="name" onblur="checkid()" /></td></tr>
                        <span class="required">*</span>
                        <div class="validate_msg_long error_msg">20长度以内的汉字、字母、数字的组合</div>
                    </div>
                   <tr><td> <div class="text_info clearfix"><span>性别：</span></div></td>
                  <td>  <div class="input_info"><input type="radio" class="readonly" name="sex" value="男">男</input> 
                    						<input type="radio" class="readonly" name="sex" value="女" >女</input></td></tr>
                    </div>
                 <tr><td>   <div class="text_info clearfix"><span>年龄：</span></div></td>
                    <div class="input_info">
                      <td>  <input type="text"  name="age"  id="age"onblur="checkage()" /></td></tr>
                        <span class="required">*</span>
                        
                     
                  
                    <div class="button_info clearfix">
                     <tr><td>   <input type="submit" value="保存" class="btn_save" /></td></tr>
                        
                    </div>
                </form>  
</body>
</html>