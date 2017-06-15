<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>Fullscreen Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container">
            <h1>登陆</h1>
            <form action="" method="post">
                <input type="text" name="username" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <tr>
                    <td>
                         <input type="text" name="num" class="num" placeholder="请输入验证码"  style="width:190px" >
                    </td>
                     <td>
                           <img id="imageCode" src="assets/image.jsp" style="width:70px">
                         <!--<input type="text" name="num" class="num" placeholder="验证码"  style="width:70px" >-->
                    </td>



                </tr>
                
                <button type="submit">点击登录</button>
                
                 <button type="reset">重置</button>

                 <tr >
                    <td >
                         <!--<button type="submit" style="width:70px">注册</button>-->
                         <a href="files/front/register.jsp" >注册</a>
                    </td>
                    <td>
                          <!--<input type="text" name="num" class="num" placeholder="请输入验证码"  style="width:140px" >-->
                         <!--<button type="submit" style="width:140px" >找回密码</button>-->
                           <a href="files/front/recover.jsp">找回密码 </a>
                    </td>
                 </tr>
                  <!--<button type="reg">注册</button>
                   <button type="recherche">找回密码</button>-->
                <div class="error"><span>+</span></div>
            </form>
      
        </div>


        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body>

</html>

