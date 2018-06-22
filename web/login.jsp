﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="${pageContext.request.contextPath }/">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>欢迎登录后台管理系统</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="js/jquery.js"></script>
    <script src="js/cloud.js" type="text/javascript"></script>

    <script language="javascript">
        $(function () {
            $('.loginbox').css({'position': 'absolute', 'left': ($(window).width() - 692) / 2});
            $(window).resize(function () {
                $('.loginbox').css({'position': 'absolute', 'left': ($(window).width() - 692) / 2});
            })
        });
    </script>

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">


<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>


<div class="logintop">
    <span>欢迎访问尚学堂OA系统</span>
    <ul>
        <li><a href="#">回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>

<div class="loginbody">

    <span class="systemlogo"></span>

    <div class="loginbox loginbox2">
        <form id="fm" action="login.action" method="post">
            <input type="hidden" name="op" value="login">
            <ul>
                <li><input name="username" type="text" class="loginuser" value="admin"
                           onclick="JavaScript:this.value=''"/></li>
                <li><input name="password" type="password" class="loginpwd" value="密码"
                           onclick="JavaScript:this.value=''"/></li>
                <li class="yzm">

                    <span><input id="checkcode" name="checkcode" type="text" value="验证码"
                                 onclick="JavaScript:this.value=''"/></span><cite id="code"></cite>

                </li>
                <li><input id="logBtn" type="button" class="loginbtn" value="登录"/><label>
                    <input name="" type="checkbox"  value="" checked="checked"/>记住密码</label><label><a
                        href="#">忘记密码？</a></label></li>
            </ul>
        </form>

    </div>

</div>


</body>

<script type="text/javascript">

    $(function () {
        $("#logBtn").click(function () {
            $.ajax({
                type:"POST",
                data:{
                    "op":"check",
                    "checkcode":$("#checkcode").val()
                },
                url : "login.action",
                success : function (result) {
                      console.log(result);

                    if(result){  //flag
                        $("#fm").submit();
                    }else{
                        alert("验证码错误！");
                    }
                }
            })


        });

         $.ajax({
             type:"POST",
             data:{"op":"createCode"},
             url : "login.action",
             success : function (result){
                $("#code").html(result);
             }
         })


    });
</script>
</html>
