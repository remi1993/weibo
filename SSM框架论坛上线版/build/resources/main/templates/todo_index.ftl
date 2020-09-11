<!DOCTYPE HTML>
<html>
<#--<head>-->
<#--    <title>ssm Todo</title>-->
<#--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>-->
<#--</head>-->
<#--<head>-->
    <title>Todo</title>
    <meta charset="utf-8">
    <meta property="wb:webmaster" content="ef074a5151f5e0a7">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="/todo1.css">
    <link rel="stylesheet" href="/todo2.css?v=6.17">
    <script src="//hm.baidu.com/hm.js?133836b1f53a591f46da5ad089a50faf"></script><script>
        // var version = "6.17",
        //     apiVersion = "v6",
        //     staticUrl = "http://s.gxtodo.com/dist/",
        //     debug = "0",
        //     socketOpen = "0",
        //     socketHeartbeat = "600000",
        //     socketReconnect = "10000",
        //     socketServer = "ws://42.120.44.116:9444",
        //     picDomain = "http://s.gxtodo.com/dist/";
        //
        // var _hmt = _hmt || [];
        // (function() {
        //     var hm = document.createElement("script");
        //     hm.src = "//hm.baidu.com/hm.js?133836b1f53a591f46da5ad089a50faf";
        //     var s = document.getElementsByTagName("script")[0];
        //     s.parentNode.insertBefore(hm, s);
        // })();

    </script>
    <script src="http://s.gxtodo.com/dist/js/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://s.gxtodo.com/dist/js/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="http://api.map.baidu.com/api?v=2.0&amp;ak=RYyvRx6GtG8CpACvsZXy7dgw"></script><script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&amp;ak=RYyvRx6GtG8CpACvsZXy7dgw&amp;services=&amp;t=20200327103013"></script>
    <script src="http://s.gxtodo.com/dist/js/libs.min.js?v=1.0"></script>
    <script src="http://s.gxtodo.com/dist/js/todo.min.js?v=6.17"></script>
</head>

<#--<body>-->
<#--<form action="/todo/add" method="POST">-->
<#--    <input type="text" name="content" placeholder="请输入todo">-->
<#--    <br>-->
<#--    <button type="submit">添加</button>-->
<#--</form>-->

<#--<div>-->

<#--    <#list todos as t>-->
<#--    <h3>${t.id} : ${t.content}</h3>-->
<#--    <a href="/todo/edit?id=${t.id}">编辑</a>-->
<#--    <a href="/todo/delete?id=${t.id}">删除</a>-->
<#--    </#list>-->
<#--</div>-->
<#--</body>-->

<body><div class="alert-wrapper"><div id="alert-top" class="alert-top"><div class="alert alert-success" style="display: none;"><i class="icon-ok-sign"></i> 创建成功<i class="icon-remove"></i></div></div></div><div class="page-wrapper task">
    <div class="column-menu column-menu-task">
        <div class="logo-wrap" id="switch-workplace">
<#--            <img class="icon-m" src="http://thirdqq.qlogo.cn/g?b=oidb&amp;k=eicxXsicsdAFKulrZRfKo7Ag&amp;s=40&amp;t=1592446908" alt=""><i class="m-icon-black-frame">&nbsp;</i>-->
            <div class="user-name">我的私事</div>
            <div class="triangle"></div>
        </div>
        <hr>

        <div class="main-menu">

            <a  class="active"><i class="m-icon-task">&nbsp;</i>Todo</a>
            <a href="/"><i class="m-icon-note">&nbsp;</i>Home</a>
            <a href="/topic"><i class="m-icon-note">&nbsp;</i>Topic</a>
            <a href="/weibo/${currentUser.id}"><i class="m-icon-project">&nbsp;</i>Weibo</a>
        </div>

        <div class="menu-bottom" style="margin-bottom: 0;height: 138px;width: 90px;">

            <a ><i class="m-icon-search">&nbsp;</i></a>

            <a  id="switch-message"><i class="m-icon-notice">&nbsp;</i>
                <span class="badge hide" style="position: absolute;margin: 10px 0px 0px -12px; background-color: #F86B4F" id="msg-num" data-num="0">0</span> </a>
            <a  style="font-size: 30px;" id="menu-more">···</a>
        </div>


<#--        <div class="panel-home should-hide" style="display: none;">-->
<#--            <a href="#/setting/profile">账号设置</a>-->
<#--            <hr>-->
<#--            <a href="#/group/list">群组管理</a>-->
<#--            <hr>-->
<#--            <a href="/intro/help.php" target="_blank">使用帮助</a>-->
<#--            <hr>-->
<#--            <a href="#" id="logout">退出登录</a>-->
<#--        </div>-->

    </div>


    <div class="main main-task" id="main" data-listwhere="{&quot;scope_start&quot;:1593792000,&quot;scope_end&quot;:1593878399,&quot;type&quot;:&quot;day&quot;,&quot;mode&quot;:&quot;timeline&quot;}" style="width: 1054px; right: 0px;">
<#--        <div class="title">-->
<#--            <div class="title-left">-->
<#--                <div class="date-wrapper">-->
<#--                    <span class="date pull-left" id="title-date" data-type="day">2020-07-04</span>-->
<#--                    <i class="m-icon-left pull-left" id="date-pre"></i>-->
<#--                    <i class="m-icon-right pull-left" id="date-next"></i>-->
<#--                </div>-->

<#--                <div class="date-type">-->
<#--                    <button type="button" class="btn btn-info active" id="date-today">今天</button>-->

<#--                    <div class="btn-group" data-toggle="buttons">-->
<#--                        <label class="btn btn-info active">-->
<#--                            <input type="radio" autocomplete="off" name="date_type" value="day" checked="" id="date-day" data-day="2020-07-04">日-->
<#--                        </label>-->
<#--                        <label class="btn btn-info">-->
<#--                            <input type="radio" autocomplete="off" name="date_type" value="week" id="date-week" data-week="">周-->
<#--                        </label>-->
<#--                        <label class="btn btn-info">-->
<#--                            <input type="radio" autocomplete="off" name="date_type" value="month" id="date-month" data-month="">月-->
<#--                        </label>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->

<#--            <div class="title-right">-->

<#--                <div class="dropdown" id="dropdown-display-mode">-->
<#--                    <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">时间轴<span class="caret"></span></button>-->
<#--                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="ul-task-mode">-->
<#--                        <li role="presentation" id="mode-four" class="">-->
<#--                            <a role="menuitem" tabindex="-1" href="#" data-mode="four">四象限</a>-->
<#--                        </li>-->
<#--                        <li role="presentation" id="mode-timeline" class="active">-->
<#--                            <a role="menuitem" tabindex="-1" href="#" data-mode="timeline">时间轴</a>-->
<#--                            <i class="m-icon-ok">&nbsp;</i></li>-->
<#--                    </ul>-->
<#--                </div>-->

<#--                <div class="dropdown" id="dropdown-display-status">-->
<#--                    <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown">全部<span class="caret"></span></button>-->
<#--                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2" id="ul-task-status">-->
<#--                        <li role="presentation" id="status-all" class="active"><a role="menuitem" tabindex="-1" href="#" data-status="all">全部</a><i class="m-icon-ok">&nbsp;</i></li>-->
<#--                        <li role="presentation" id="status-finished"><a role="menuitem" tabindex="-1" href="#" data-status="finished">已完成</a></li>-->
<#--                        <li role="presentation" id="status-unfinished"><a role="menuitem" tabindex="-1" href="#" data-status="unfinished">未完成</a></li>-->
<#--                    </ul>-->
<#--                </div>-->

<#--                <a href="#" class="create btn-create-task" id="btn-create-task" data-create_data="{}">+</a>-->

<#--            </div>-->

<#--        </div>-->
        <div class="content" id="content" style="height: 714px;">
            <div id="task-main" class="task-main task-main-timeline" data-task-load="1"><div class="form-timeline-wrap">
                    <form method="post" action="/todo/add" id="form-timeline" class="form-timeline">
                        <input type="text" class="form-control m-hide should-hide" value="" name="content" placeholder="按Enter完成输入" autofocus="autofocus" maxlength="500" style="display: inline-block;">
<#--                        <div class="btn-timeline-add bg-rank1" style="cursor: default;"><i class="m-icon-plus-white">&nbsp;</i></div>-->
<#--                        <div class="timeline-add-tip light should-show" style="cursor: pointer; display: none;">新建任务</div>-->
<#--                        <div class="task-info m-hide should-hide" style="display: block;">-->
<#--&lt;#&ndash;                            <div class="iradio_todo-red checked" style="position: relative;"><input type="radio" class="quick-rank quick-rank1" name="rd_rank" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>&ndash;&gt;-->
<#--&lt;#&ndash;                            <div class="iradio_todo-yellow" style="position: relative;"><input type="radio" class="quick-rank quick-rank2" name="rd_rank" value="2" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>&ndash;&gt;-->
<#--&lt;#&ndash;                            <div class="iradio_todo-blue" style="position: relative;"><input type="radio" class="quick-rank quick-rank3" name="rd_rank" value="3" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>&ndash;&gt;-->
<#--&lt;#&ndash;                            <div class="iradio_todo-green" style="position: relative;"><input type="radio" class="quick-rank quick-rank4" name="rd_rank" value="4" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>&ndash;&gt;-->
<#--                            <span class="vertical-line">&nbsp;</span>-->
<#--                            <input type="hidden" name="is_all_day" value="0">-->
<#--                            <input type="hidden" name="rank" value="1">-->
<#--                            <input type="hidden" name="privacy" value="6720">-->

<#--                            <input type="hidden" name="start_at" value="1593869400">-->
<#--                            <div class="start-at m-calendar" data-name="start_at">-->
<#--                                <span class="start_at-date">2020-07-04</span> <span class="start_at-time task-time">21:30</span>-->
<#--                            </div>-->
<#--                            <i class="m-icon-from-to">&nbsp;</i>-->
<#--                            <input type="hidden" name="end_at" value="1593873000">-->
<#--                            <div class="end-at m-calendar" data-name="end_at">-->
<#--                                <span class="end_at-date">2020-07-04</span> <span class="end_at-time task-time">22:30</span>-->
<#--                            </div>-->
<#--                            <span class="vertical-line">&nbsp;</span>-->
<#--                            <span class="set-more">提交</span>-->
<#--                        </div>-->
                        <input type="submit" value="保存" class="hidden">
                    </form>

                </div>
                <div id="timeline-wrap" style="height: 673px;">

                    <div id="timeline" class="timeline" data-current-start="" data-min-repeat="" data-page="" data-count="" data-need_to_today="0" data-scrollto="#day-wrap2020-07-04" style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
                        <div class="timeline-day-wrap clearfix" id="day-wrap2020-07-04">
                            <div class="day light"><i>&nbsp;</i>To Do 让你从工作到娱乐都保持专注。</div>
                            <#list todos as t>
                            <div class="timeline-task unfinished 4fc20b2928819918a1974f52f36ea234 3307df5b7fe7f163e98f199fc37d62d6" data-role="7680" data-task_id="4fc20b2928819918a1974f52f36ea234" data-uid="3307df5b7fe7f163e98f199fc37d62d6" data-is_repeat="0" data-repeat_end="">
                                <div class="icheckbox_todo-red" style="position: relative;">
                                    <input type="checkbox" class="rank1" data-rank="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;">
                                    <ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                </div>
                                <div class="task-name-users">
                                    <span class="task-name">
<#--                                    ${t.id} :-->
                                        ${t.content}
                                    <a href="/todo/edit?id=${t.id}">编辑</a>
                                    <a href="/todo/delete?id=${t.id}">删除</a>
                                    </span>
                                </div>
                                <div class="task-base-info light">
                                    <i class="m-icon-time">&nbsp;</i>
                                    <span class="start-at task-time" data-start_at="1593869400" data-end_at="1593873000">
                                    创建时间 ${t.createdTime?number_to_datetime?string("yyyy-MM-dd HH:mm:ss")}
                                    </span>
                                </div>
                            </div>
                            </#list>
<#--                                    <i class="m-icon-child-task">&nbsp;</i><span class="child-task">0</span>-->
                        </div>
                    </div>


                    <div class="iScrollVerticalScrollbar iScrollLoneScrollbar" style="position: absolute; z-index: 9999; width: 7px; bottom: 2px; top: 2px; right: 1px; overflow: hidden; transform: translateZ(0px); transition-duration: 500ms; opacity: 0;"><div class="iScrollIndicator" style="box-sizing: border-box; position: absolute; background: rgba(0, 0, 0, 0.5); border: 1px solid rgba(255, 255, 255, 0.9); border-radius: 3px; width: 100%; transition-duration: 0ms; display: none; height: 664px; transform: translate(0px, 0px) translateZ(0px); transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1);"></div></div></div></div>
        </div>
    </div>
</div>
</body>
</html>