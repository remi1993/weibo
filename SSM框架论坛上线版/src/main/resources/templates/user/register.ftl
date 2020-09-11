<!DOCTYPE html>
<html lang="en">
<#--<head>-->
<#--    <meta charset="UTF-8">-->
<#--    <title>注册页面</title>-->
<#--</head>-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>注册页面</title>

    <!-- Bootstrap core CSS -->
    <link href="/login.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/login3.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/login2.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<#--<body>-->
<#--    <h1>注册</h1>-->
<#--    <form action="/user/register" method="post">-->
<#--        <input type="text" name="username" placeholder="请输入用户名">-->
<#--        <br>-->
<#--        <input type="text" name="password" placeholder="请输入密码">-->
<#--        <br>-->
<#--        <button type="submit">注册</button>-->
<#--    </form>-->
<#--&lt;#&ndash;    <h3>${user.username}</h3>&ndash;&gt;-->
<#--</body>-->
<body>
<div class="container">
    <form class="form-signin" action="/user/register" method="post">
        <h2 class="form-signin-heading">请注册您的账户</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" name="username" class="form-control" placeholder="请输入用户名" >
        <label for="inputPassword" class="sr-only">Password</label>
        <input  type="text" name="password" class="form-control" placeholder="请输入密码" >
        <div class="checkbox">
<#--            <label>-->
<#--                <input type="checkbox" value="remember-me"> 记住我-->
<#--            </label>-->
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
        <#--        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>-->
    </form>

</div> <!-- /container -->


<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>


</body>
</html>