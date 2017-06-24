<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" /> 
    </head>
    <body class="index">
        <!--导航区域开始-->
        <div id="header">
        欢迎你：<%=session.getAttribute("xingming")%>
            <img src="images/logo.png" alt="logo" class="left"/>
            <a href="login.jsp">[退出]</a>            
        </div>
        <div id="index_navi">
            <ul id="menu">
                <li><a href="index.jsp"   class="index_on"></a></li>
                <li><a href="role/role_list.html" class="role_off"></a></li>
                <li><a href="Newbuyer.jsp?page=1" class="admin_off"></a></li><%--管理员改成采购员管理 --%>
                <li><a href="buy_manager/buy_manager.jsp?page=1" class="fee_off"></a></li>
                <li><a href="product_manager/select_product.jsp" class="account_off"></a></li>
                <li><a href="NewServlet" class="service_off"></a></li>
                <li><a href="bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="report/report_list.html" class="report_off"></a></li>
                <li><a href="user/user_info.html" class="information_off"></a></li>
                <li><a href="user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>
        </div>
    </body>
</html>
