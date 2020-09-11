<!DOCTYPE HTML>
<html>
<#--<head>-->
<#--    <title>微博</title>-->
<#--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>-->
<#--</head>-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>微博</title>

    <!-- Bootstrap core CSS -->
    <link href="/weibo1.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/weibo2.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/weibo3.css" rel="stylesheet">

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
<#--<form action="/weibo/add" method="POST">-->
<#--    <input type="text" name="content" placeholder="请输入微博">-->
<#--    <br>-->
<#--    <button type="submit">添加</button>-->
<#--</form>-->

<#--<div>-->

<#--    <#list weibos as w>-->
<#--        <h3>${w.id} : ${w.content}</h3>-->
<#--        <a href="/weibo/edit?id=${w.id}">编辑</a>-->
<#--        <a href="/weibo/delete?id=${w.id}">删除</a>-->
<#--    </#list>-->
<#--</div>-->
<#--</body>-->
<body>
<#--<form action="/weibo/add" method="POST">-->
<#--    <input type="text" name="content" placeholder="请输入微博">-->
<#--    <br>-->
<#--    <button type="submit">添加</button>-->
<#--</form>-->
<#--<div>-->


</div>
<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href='/'>15Min论坛</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href='/'>Home</a></li>
                <li><a href="/todo/${currentUser.id}">Todo</a></li>
                <li><a href="/topic">Topic</a></li>
                <li><a href="/weibo/${currentUser.id}">Weibo</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">More <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/login">登录</a></li>
                        <li><a href="/register">注册</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav><!-- /.navbar -->

<div class="container">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
            <p class="pull-right visible-xs">
                <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
            </p>
            <div class="jumbotron">
                <form action="/weibo/add" method="POST">
                    <h1>Hello, world!</h1>
                    <p>这里是${user.username}的个人微博</p>
                    <input type="text" name="content" placeholder="请输入微博">
                    <button type="submit">添加 »</button>
                </form>
            </div>
            <div class="row">
                <#list weibos as w>
                <div class="col-xs-6 col-lg-4" style="border-bottom-width: 10px; padding-bottom: 15px; border-top-width: 20px; padding-top: 15px;">
<#--                    <h2>Heading</h2>-->
                    <p>  ${w.content} </p>
<#--                    <button href="/weibo/delete?id=${w.id}" type="submit">删除 »</button>-->
<#--                    <button href="/weibo/edit?id=${w.id}" type="submit">编辑 »</button>-->
                    <p><a class="btn btn-default" href="/weibo/delete?id=${w.id}" role="button">删除 »</a></p>
                    <p><a class="btn btn-default" href="/weibo/edit?id=${w.id}" role="button">编辑 »</a></p>
                </div><!--/.col-xs-6.col-lg-4-->
                </#list>
            </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
<#--            <div class="list-group">-->
<#--                <a class="list-group-item active">博主信息</a>-->
<#--                <a href="/user/${userId}" class="list-group-item">-->
<#--                    <a class="user_avatar" href="/user/${userId}">-->
<#--                        <img src="${user.avatar}" title="${user.username}">-->
<#--                    </a>-->
<#--                </a>-->
<#--            </div>-->
        </div><!--/.sidebar-offcanvas-->
    </div><!--/row-->

    <hr>

    <footer>
        <p>© Company 2020</p>
    </footer>

</div><!--/.container-->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
<script src="offcanvas.js"></script>


</body>
</html>