<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" /> 
</head>
<!-- <script type="text/javascript">
function check(){
	var name =f1.user.value;
	
	
	if(name=="")
		{
			alert("账号不为空");
			f1.name.foucus();
		}
	else if(name.length>15){
		alert("账号长度不超过15");
		f1.name.foucus();
	} 
	else  {
		
		f1.submit();
	}
} -->
</script>

    <body class="index">
        <div class="login_box">
         <form  action="verifyLogin.jsp" method="post" name ="f1" >
            <table>
         
                <tr>
                    <td class="login_info">账号：</td>
                    <td colspan="2"><input name="user" type="text" class="width150" /></td>
               
                </tr>
                <tr> 
                    <td class="login_info">密码：</td>
                    <td colspan="2"><input name="password" type="password" class="width150" /></td>
                 
                </tr>
                <tr>
                    <td class="login_info">验证码：</td>
                    <td class="width70"><input name="code" type="text" class="width70" /></td>
                    <td><img src="number.jsp" alt="验证码" title="点击更换" /></td>  
                       
                        
                </tr>            
                <tr>
                    <td></td>
                    <td class="login_button" colspan="2">
                    <%--    <a href=""><img src="images/login_btn.png" /></a>--%>
                   <%--  <%String co=(String)session.getAttribute("rcode"); %> --%>
                    
                     <input type="submit" value="  提交    "  > 
                    </td>  
                     
                  <%--    <td><span class="required">用户名或密码错误，请重试</span></td>  --%>              
                </tr>
              </form>   
            </table>
        </div>
    </body>
</body>
</html>