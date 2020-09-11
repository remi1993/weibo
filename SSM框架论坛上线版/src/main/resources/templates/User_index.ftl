<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- meta -->
    <meta charset="utf-8">
    <meta name="description" content="CNode：Node.js专业中文社区">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="nodejs, node, express, connect, socket.io">
    <meta name="referrer" content="always">


    <meta name="author" content="EDP@TaoBao">

    <meta property="wb:webmaster" content="617be6bd946c6b96">


    <link title="RSS" type="application/rss+xml" rel="alternate" href="/rss">


    <link rel="icon" href="//static2.cnodejs.org/public/images/cnode_icon_32.png" type="image/x-icon">


    <!-- style -->
    <link rel="stylesheet" href="/User_index.css">


    <!-- scripts -->
    <script async="" src="https://www.google-analytics.com/analytics.js"></script><script src="//static2.cnodejs.org/public/index.min.f7c13f64.min.js"></script>



    <title>@${user.username} 的个人主页</title>

    <meta content="_csrf" name="csrf-param">
    <meta content="D6SspBhU-1htppI-4Tf5it2Vill6f5ryJUmg" name="csrf-token">
</head>
<body>
<!-- navbar -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" href="/">
<#--                <img src="//static2.cnodejs.org/public/images/cnodejs_light.svg">-->
            </a>

            <form id="search_form" class="navbar-search" action="/search">
<#--                <input type="text" id="q" name="q" class="search-query span3" value="">-->
            </form>

            <ul class="nav pull-right">
                <li><a href="/">Home</a></li>
                <li><a href="/login">Login</a></li>
                <li><a href="/register">Register</a></li>
                <li><a href="/todo/${userId}">Todo</a></li>
                <li><a href="/topic">Topic</a></li>
                <li><a href="/weibo/${userId}">Weibo</a></li>
            </ul>

            <a class="btn btn-navbar" id="responsive-sidebar-trigger">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
        </div>
    </div>
</div>
<div id="main">
    <div id="sidebar">

        <div class="panel">

            <div class="header">
                <span class="col_fade">个人信息</span>
            </div>
            <div class="inner">
                <div class="user_card">
                    <div>
                        <a class="user_avatar" href="/user/${userId}">
                            <img src="${user.avatar}" title="${user.username}">
                        </a>
                        <span class="user_name"><a class="dark" href="/user/${user.id}">${user.username}</a></span>

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


                <script>
                    $(document).ready(function () {
                        $('.follow_btn').click(function () {
                            var $me = $(this);
                            var action = $me.attr('action');
                            var params = {
                                follow_id: '5ef1bb5d13f8b244e57cb2a1',
                                _csrf: 'D6SspBhU-1htppI-4Tf5it2Vill6f5ryJUmg'
                            };
                            $.post('/user/' + action, params, function (data) {
                                if (data.status === 'success') {
                                    var $btns = $('.follow_btn');
                                    if (action === 'follow') {
                                        $btns.html('取消关注');
                                        $btns.attr('action', 'un_follow');
                                    } else {
                                        $btns.html('加入关注');
                                        $btns.attr('action', 'follow');
                                    }
                                    $btns.toggleClass('btn-success');
                                }
                            }, 'json');
                        });
                    });
                </script>


            </div>

        </div>


        <div class="panel">
            <div class="inner">
                <a href="/topic" id="create_topic_btn">
                    <span class="span-success">发布话题</span>
                </a>
            </div>
        </div>

    </div>


    <div id="content">
        <div class="panel">
            <div class="header">
                <ul class="breadcrumb">
                    <li><a href="/">主页</a><span class="divider">/</span></li>
                </ul>
            </div>
            <div class="inner userinfo">

                <div class="user_big_avatar">
                    <img src="${user.avatar}" class="user_avatar" title="${user.username}">
                </div>

                <a class="dark">${user.username}</a>

                <div class="user_profile">
                    <ul class="unstyled"></ul>
                </div>

                <p class="col_fade">注册时间 ${user.createdTime?number_to_date?string("yyyy-MM-dd HH:mm:ss")}</p>

            </div>
        </div>

        <div class="panel">
            <div class="header">
                <span class="col_fade">最近创建的话题</span>
            </div>

            <div class="cell">
                <#list topics as t>
                    <div class="topic_title_wrapper">
                        <a class="user_avatar " href="/user/${userId}">
                            <img src="${user.avatar}" title="${user.username}">
                        </a>
                        <a class="topic_title" href="/topic/detail/${t.id}" title="${t.title}">
                            ${t.title}
                        </a>
                        <a class="last_time pull-right" href="/topic/detail/${t.id}">
<#--                            <img class="user_small_avatar" src="${user.avatar}">-->
                            <span class="last_active_time">发帖时间 ${t.createdTime?number_to_date?string("yyyy-MM-dd HH:mm:ss")}</span>
                        </a>
                    </div>
                </#list>
            </div>
        </div>

        <div class="panel">
            <div class="header">
                <span class="col_fade">最近参与的话题</span>
            </div>

            <div class="cell">
                <#list topicComments as t >
                    <#list t.commentList as c >
                    <#list t.userList as u >
                    <div class="topic_title_wrapper">
                        <a class="user_avatar " href="/user/${t.userId}">
                            <img src="${u.avatar}" title="${u.username}">
                        </a>
                        <a class="topic_title" href="/topic/detail/${t.id}" title="${t.title}">
                            ${t.title}
                        </a>
                        <a class="last_time pull-right" href="/topic/detail/${t.id}">
<#--                            <img class="user_small_avatar" src="${user.avatar}">-->
                            <span class="last_active_time">
                            回复时间 ${c.updatedTime?number_to_date?string("yyyy-MM-dd HH:mm:ss")}
<#--                                long先转date再转string-->
                            </span>
                        </a>

                    </div>
                    </#list>
                    </#list>
                </#list>
            </div>
    </div>


    <script>
        $(document).ready(function () {
            $('#set_star_btn').click(function () {
                var $me = $(this);
                var action = $me.attr('action');
                var params = {
                    user_id: '5ef1bb5d13f8b244e57cb2a1',
                    _csrf: 'D6SspBhU-1htppI-4Tf5it2Vill6f5ryJUmg'
                };
                $.post('/user/' + action, params, function (data) {
                    if (data.status === 'success') {
                        if (action === 'set_star') {
                            $me.html('取消达人');
                            $me.attr('action', 'cancel_star');
                        } else {
                            $me.html('设为达人');
                            $me.attr('action', 'set_star');
                        }
                    }
                }, 'json');
            });

            $('#set_block_btn').click(function () {
                var $me = $(this);
                var action = $me.attr('action');
                var params = {
                    _csrf: 'D6SspBhU-1htppI-4Tf5it2Vill6f5ryJUmg',
                    action: action
                };
                if (action === 'set_block' && !confirm('确定要屏蔽该用户吗？')) {
                    return;
                }
                $.post('/user/remi1993/block', params, function (data) {
                    if (data.status === 'success') {
                        if (action === 'set_block') {
                            $me.html('取消屏蔽用户');
                            $me.attr('action', 'cancel_block');
                        } else if (action === 'cancel_block') {
                            $me.html('屏蔽用户');
                            $me.attr('action', 'set_block');
                        }
                    }
                }, 'json');
            })

            $('#delete_all').click(function () {
                var $me = $(this);
                var params = {
                    _csrf: 'D6SspBhU-1htppI-4Tf5it2Vill6f5ryJUmg',
                };
                if (!confirm('确定要删除吗？（不会永久删除，只做标记位）')) {
                    return;
                }
                $.post('/user/remi1993/delete_all', params, function (data) {
                    if (data.status === 'success') {
                        alert('操作成功');
                    }
                }, 'json');
            })
        });
    </script>


<div id="sidebar-mask"></div>


<script>
    // google analytics
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script', "https://www.google-analytics.com/analytics.js",'ga');

    ga('create', 'UA-41753901-5', 'auto');
    ga('send', 'pageview');
</script>



<div style="display:none;">
    <script src="//s95.cnzz.com/z_stat.php?id=1254020586&amp;web_id=1254020586" language="JavaScript"></script><script src="https://c.cnzz.com/core.php?web_id=1254020586&amp;t=z" charset="utf-8" type="text/javascript"></script><a href="https://www.cnzz.com/stat/website.php?web_id=1254020586" target="_blank" title="站长统计">站长统计</a>
</div>




</body>
</html>