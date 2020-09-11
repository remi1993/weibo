<!DOCTYPE HTML>
<html>
<#--<head>-->
<#--    <title>ssm Topic</title>-->
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

    <title>Off Canvas Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="/topicindex1.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/topicindex2.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/topicindex3.css" rel="stylesheet">

    <link rel="stylesheet" href="/topicindex4.css" media="all">

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


<#--<div>-->

<#--    <#list topics as t>-->
<#--        <h3>-->
<#--            <a href="/topic/detail/${t.id}">${t.id}: ${t.title} 创建时间:${t.createdTime?number_to_date?string("yyyy-MM-dd hh:mm:ss")} 修改时间:${t.updatedTime?number_to_date?string("yyyy-MM-dd hh:mm:ss")}</a>-->
<#--        </h3>-->


<#--    <a href="/topic/edit?id=${t.id}&token=${token}">编辑</a>-->
<#--    <a href="/topic/delete?id=${t.id}">删除</a>-->
<#--&lt;#&ndash;    <a href="/topic/delete?id=${t.id}&token=${token}">删除</a>&ndash;&gt;-->
<#--</#list>-->


<#--&lt;#&ndash;    &ltscript&gtalert("你被攻击了")&lt/script&gt&ndash;&gt;-->
<#--</div>-->



<#--<form action="/topic/add" method="POST">-->
<#--    <input type="text" name="title" placeholder="请输入帖子名字">-->
<#--    <br>-->
<#--    <input type="text" name="content" placeholder="请输入帖子内容">-->
<#--    <br>-->
<#--    <input type="text" name="boardId" placeholder="请输入板块id">-->
<#--    <br>-->
<#--    <button type="submit">添加</button>-->
<#--</form>-->
<#--</body>-->

<body>
<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">15Min论坛</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/">Home</a></li>
                <li><a href="/todo/${currentUser.id}">Todo</a></li>
                <li class="active"><a href="/topic">Topic</a></li>
                <li><a href="/weibo/${currentUser.id}">Weibo</a></li>
            </ul>
        </div><!-- /.nav-collapse -->
    </div><!-- /.container -->
</nav><!-- /.navbar -->
<div id="main">
    <div id="sidebar">
        <div class="panel">
            <div class="header">
                <span class="col_fade">个人信息</span>
            </div>
            <div class="inner">
                <div class="user_card">
                    <div>
                        <a class="user_avatar" href="/user/${currentUser.id}">
                            <img src="${currentUser.avatar}" title=${currentUser.username}>
                        </a>
                        <span class="user_name"><a class="dark" href="/user/${currentUser.id}">${currentUser.username}</a></span>
                        <div class="board clearfix">
                            <div class="floor">
<#--                                <span class="big">积分: 15 </span>-->
                            </div>
                        </div>
                        <div class="space clearfix"></div>
                        <span class="signature">
        “

            这家伙很懒，什么个性签名都没有留下。

        ”
    </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel">
            <div class="inner">
<#--                <a href="/topic/add" id="create_topic_btn">-->
                <form action="/topic/add" method="POST">
                    <input type="text" name="title" placeholder="请输入帖子标题">
                    <br>
                    <input type="text" name="content" placeholder="请输入帖子内容">
                    <br>
<#--                    默认所有帖子都发往板块1-->
                    <input type="text" style="display:none"  name="boardId"  value="1">
                    <button type="submit" class="span-success">发布话题</button>
                </form>

<#--                </a>-->
            </div>
        </div>
    </div>
    <div id="content">
        <div class="panel">
            <div class="header">
                <a class="topic-tab current-tab">全部</a>
            </div>
            <div class="inner no-padding">
                <div id="topic_list">
                    <#list topics as t>
                    <#list t.userList as u>
                    <#--        <h3>-->
                    <#--            <a href="/topic/detail/${t.id}">${t.id}: ${t.title} 创建时间:${t.createdTime?number_to_date?string("yyyy-MM-dd hh:mm:ss")} 修改时间:${t.updatedTime?number_to_date?string("yyyy-MM-dd hh:mm:ss")}</a>-->
                    <#--        </h3>-->


                    <#--    <a href="/topic/edit?id=${t.id}&token=${token}">编辑</a>-->
                    <#--    <a href="/topic/delete?id=${t.id}">删除</a>-->
                    <div class="cell">
                        <a class="user_avatar pull-left" href="/user/${t.userId}">
                            <img src="${u.avatar}" title="${u.username}">
                        </a>

                        <span class="reply_count pull-left">
<#--    <span class="count_of_replies" title="回复数">-->
<#--      4-->
<#--    </span>-->
<#--    <span class="count_seperator">/</span>-->
<#--    <span class="count_of_visits" title="点击数">-->
<#--      8781-->
<#--    </span>-->
  </span>

                        <a class="last_time pull-right" href="/topic/5efb4c5d13f8b244e57cc632#5efff3bdb2a7c073cb32a773">
<#--                            <img class="user_small_avatar" src="https://avatars3.githubusercontent.com/u/54534967?v=4&amp;s=120">-->
                            <span class="last_active_time">发表时间:${t.createdTime?number_to_date?string("yyyy-MM-dd HH:mm")}</span>
                        </a>

                        <div class="topic_title_wrapper">
<#--                            <span class="put_top">置顶</span>-->
                            <a class="topic_title" href="/topic/detail/${t.id}" title="${t.title}">
                                ${t.title}
                            </a>
                        </div>
                    </div>
                    </#list>
                    </#list>
                </div>
            </div>
        </div>
    </div>

<div id="backtotop" style="display: none; top: 479px; right: 0px;">回到顶部</div>
<div id="footer"></div>
<div id="sidebar-mask"></div>

<div class="container"></div>

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