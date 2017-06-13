<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>找回密码功能</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="../../assets/css/reset.css">
        <link rel="stylesheet" href="../../assets/css/supersized.css">
        <link rel="stylesheet" href="../../assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>
        <div class="page-container">
            <h1>找回密码</h1>
            <form action="" method="post">
                <input type="text" name="username" class="username" placeholder="请输入您的用户名">
<!--                 <input type="password" name="password" class="password" placeholder="请输入新的密码">
                <input type="password" name="newpassword" class="newpassword" placeholder="请重复新密码"> -->
                <input type="text" name="reovcer_email" class="reovcer_email" placeholder="请输入邮箱"  >
                <input type="text" name="reovcer_copy_email" class="reovcer_copy_email" placeholder="请再次输入邮箱"  oncopy="return false;" onpaste="return false;" oncut="return false;">
                
                <button type="submit">完成</button>
                 <button type="reset">重置</button>
                 <a href="../../login.jsp">返回登录页面</a>
                  <!--<button type="reg">注册</button>
                   <button type="recherche">找回密码</button>-->
                <div class="error"><span>+</span></div>
            </form>
        </div>
        <!-- Javascript -->
        <script src="../../assets/js/jquery-1.8.2.min.js"></script>
        <script src="../../assets/js/supersized.3.2.7.min.js"></script>
        <script src="../../assets/js/supersized-init2.js"></script>
        <script src="../../assets/js/scripts.js"></script>

    </body>

</html>

