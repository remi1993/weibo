<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<#--<head>-->
<#--    <meta charset="UTF-8">-->
<#--    <title>帖子详情</title>-->
<#--</head>-->
<head>
    <!-- meta -->
    <meta charset="utf-8">
    <meta name="description" content="15Min论坛">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="帖子详情">
    <!-- see http://smerity.com/articles/2013/where_did_all_the_http_referrers_go.html -->
    <meta name="referrer" content="always">


    <meta name="author" content="EDP@TaoBao">

    <meta property="wb:webmaster" content="617be6bd946c6b96">


<#--    <link title="RSS" type="application/rss+xml" rel="alternate" href="/rss">-->


<#--    <link rel="icon" href="//static2.cnodejs.org/public/images/cnode_icon_32.png" type="image/x-icon">-->


    <!-- style -->
<#--    <link rel="stylesheet" href="/topicdetail1.css" media="all">-->
    <link href="/topicindex1.css" rel="stylesheet">
    <link rel="stylesheet" href="/topicindex4.css" media="all">


    <!-- scripts -->
    <script async="" src="https://www.google-analytics.com/analytics.js"></script><script src="//static2.cnodejs.org/public/index.min.f7c13f64.min.js"></script>

    <title>${topic.title}</title>

    <meta content="_csrf" name="csrf-param">
    <meta content="mc5DDw00-Mf70jzXrIDPHODO6b7mUZpU5mDA" name="csrf-token">
</head>
<#--<body>-->
<#--<h1>${topic.title}</h1>-->
<#--<p>${topic.content}</p>-->
<#--<#list topic.userList as u>-->
<#--<a  href="/user/${topic.userId}">-->
<#--    <span> 作者:${u.username}</span>-->
<#--</a>-->
<#--</#list>-->

<#--<#list topic.commentList as c>-->
<#--    <div>-->
<#--        ${c.id}| ${c.content}| ${c.userId}|创建时间 ${c.createdTime?number_to_datetime?string("yyyy-MM-dd hh:mm:ss")}|修改时间 ${c.updatedTime?number_to_datetime?string("yyyy-MM-dd hh:mm:ss")}-->
<#--        <a href="/topiccomment/edit?id=${c.id}&token=${token}">编辑</a>-->
<#--        <a href="/topiccomment/delete?id=${c.id}&topicId=${topic.id}&token=${token}">删除</a>-->
<#--    </div>-->
<#--</#list>-->
<#--<form action="/topiccomment/add" method="POST">-->
<#--    <input type="text" name="topicId" value="${topic.id}">-->
<#--    <input type="text" name="content" placeholder="请输入评论">-->
<#--    <br>-->
<#--    <button type="submit">添加</button>-->
<#--</form>-->
<#--</body>-->

<body>
<!-- navbar -->
<div class="navbar">
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
                <li><a href="/todo/2">Todo</a></li>
                <li class="active"><a href="/topic">Topic</a></li>
                <li><a href="/weibo">Weibo</a></li>
            </ul>
        </div><!-- /.nav-collapse -->
    </div>
<#--    <div class="navbar-inner">-->
<#--        <div class="container">-->
<#--            <a class="brand" href="/">-->

<#--                <img src="//static2.cnodejs.org/public/images/cnodejs_light.svg">-->

<#--            </a>-->

<#--            <form id="search_form" class="navbar-search" action="/search">-->
<#--                <input type="text" id="q" name="q" class="search-query span3" value="">-->
<#--            </form>-->
<#--            <ul class="nav pull-right">-->
<#--                <li><a href="/">首页</a></li>-->

<#--                <li>-->
<#--                    <a href="/my/messages">-->

<#--                        未读消息-->
<#--                    </a>-->
<#--                </li>-->

<#--                <li><a href="/getstart">新手入门</a></li>-->
<#--                <li><a href="/api">API</a></li>-->

<#--                <li><a href="/about" target="">关于</a></li>-->


<#--                <li><a href="/setting">设置</a></li>-->
<#--                <li>-->
<#--                    <a href="/signout" data-method="post" rel="nofollow">退出</a>-->
<#--                </li>-->

<#--            </ul>-->
<#--            <a class="btn btn-navbar" id="responsive-sidebar-trigger">-->
<#--                <span class="icon-bar"></span>-->
<#--                <span class="icon-bar"></span>-->
<#--                <span class="icon-bar"></span>-->
<#--            </a>-->
<#--        </div>-->
<#--    </div>-->
</div>
<div id="main">
    <div id="sidebar">
        <div class="panel">
            <div class="header">
                <span class="col_fade">作者</span>
            </div>
            <div class="inner">
                <div class="user_card">
                    <div>
                        <#list topic.userList as u>

                        <a class="user_avatar" href="/user/${topic.userId}">
                            <img src="${u.avatar}" title="${u.username}">
                        </a>
                        <span class="user_name"><a class="dark" href="/user/${topic.userId}">${u.username}</a></span>
                        <div class="board clearfix">
                            <div class="floor">
<#--                                <span class="big">积分: 20 </span>-->
                            </div>
                        </div>
                        <div class="space clearfix"></div>
                        <span class="signature">
        “

            这家伙很懒，什么个性签名都没有留下。

        ”
    </span>
                        </#list>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="content">
        <div class="panel">
            <div class="header topic_header">
            <span class="topic_full_title">${topic.title}</span>
                <div class="changes">
                <span>
                  发布于 ${topic.createdTime?number_to_datetime?string("yyyy-MM-dd HH:mm:ss")}
                </span>
                <span>
                    <#list topic.userList as u>
                  作者 <a href="/user/${topic.userId}">${u.username}</a>
                    </#list>
                       <a href="/topic/edit?id=${topic.id}&token=${token}">编辑</a>
                       <a href="/topic/delete?id=${topic.id}">删除</a>
                </span>
<#--                <input class="span-common span-success pull-right collect_btn" type="submit" value="收藏" action="collect">-->
                </div>
                <div id="manage_topic"></div>
            </div>
            <div class="inner topic">
                <div class="topic_content">
                    <div class="markdown-text"><p>${topic.content}</p></div>
                </div>
            </div>
        </div>
        <div class="panel">
            <div class="header">
                <span class="col_fade"> 回复</span>
            </div>
                <div class="cell reply_area reply_item " reply_id="5efe9a1513f8b244e57ccd6b" reply_to_id="" id="5efe9a1513f8b244e57ccd6b">
                    <#list topic.commentList as c>
                    <#list topic.userList as u>
                    <#list topiccomment.userList as cu>
                    <div class="author_content">
                    <a href="/user/${c.userId}" class="user_avatar"><img src="${cu.avatar}" title="lzq920"></a>
                        <div class="user_info">
                            <a class="dark reply_author" href="/user/${c.userId}">${cu.username}</a>
                            <a class="reply_time" href="#5efe9a1513f8b244e57ccd6b">•${c.updatedTime?number_to_datetime?string("yyyy-MM-dd hh:mm:ss")}</a>
                        </div>
                    <div class="user_action">
      <span>
<#--        <i class="fa up_btn           fa-thumbs-o-up invisible" title="喜欢"></i>-->
        <span class="up-count"></span>
      </span>
<#--                        <span><i class="fa fa-reply reply2_btn" title="回复"></i></span>-->
                    </div>
                    </div>
                <div class="reply_content from-lzq920">
                    <div class="markdown-text"><p>${c.content}</p></div>
                </div>
                    </#list>
                    </#list>
                    </#list>
                <div class="clearfix">   <div class="reply2_area"></div>   </div>
            </div>
        </div>


        <div class="panel">
            <div class="header">
                <span class="col_fade">添加回复</span>
            </div>
            <div class="inner reply">
                <form id="reply_form" action="/topiccomment/add" method="post">

                    <div class="markdown_editor in_editor">
                        <div class="markdown_in_editor">
                            <textarea class="editor" name="r_content" rows="8" style="display: none;"></textarea>
                            <div class="CodeMirror cm-s-paper">
                                <div style="overflow: hidden; position: relative; width: 3px; height: 0px; top: 8.79993px; left: 4px;"><textarea autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0" style="position: absolute; padding: 0px; width: 1000px; height: 1em; outline: none; font-size: 4px;"></textarea></div><div class="CodeMirror-hscrollbar" style="left: 0px;"><div style="height: 1px;"></div></div><div class="CodeMirror-vscrollbar"><div style="width: 1px;"></div></div><div class="CodeMirror-scrollbar-filler"></div><div class="CodeMirror-gutter-filler"></div>
                                <div class="CodeMirror-scroll" tabindex="-1">
                                    <div class="CodeMirror-sizer" style="min-width: 41.375px; margin-left: 0px; min-height: 36px;">
                                        <div style="position: relative; top: 0px;">
                                            <div class="CodeMirror-lines">
                                                <div style="position: relative; outline: none;">
                                                    <div class="CodeMirror-measure"><pre><span>​</span></pre></div>
                                                    <div style="position: relative; z-index: 1; display: none;"></div>
                                                    <div class="CodeMirror-code" style="" type="text" name="content" placeholder="请输入评论">
                                                        <input type="text" name="topicId" hidden value="${topic.id}" style="display:none">
<#--                                                        <pre>&nbsp;</pre>-->
                                                        <textarea type="text" name="content" placeholder="请输入评论" style="height: 150px ; width: 100%">
                                                        </textarea>
                                                    </div>
                                                    <div class="CodeMirror-cursor" style="left: 4px; top: 4.79993px; height: 17.6px;">&nbsp;</div>
                                                    <div class="CodeMirror-cursor CodeMirror-secondarycursor" style="display: none;">&nbsp;</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="position: absolute; height: 30px; width: 1px; top: 36px;"></div>
                                    <div class="CodeMirror-gutters" style="display: none; height: 160px;"></div>
                                </div>
                            </div>
                            <div class="editor_buttons">
<#--                                <input type="text" name="content" placeholder="请输入评论">-->
                                <input class="span-primary submit_btn" type="submit" data-loading-text="回复中.." value="回复">
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" id="_csrf" value="mc5DDw00-Mf70jzXrIDPHODO6b7mUZpU5mDA">
                </form>

            </div>
        </div>
    </div>

    <div class="replies_history" style="display: none;">
        <div class="inner_content"></div>
        <div class="anchor"></div>
    </div>

    <!-- markdown editor -->
    <script src="//static2.cnodejs.org/public/editor.min.1a456564.min.js"></script>

</div><div class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editorToolImageTitle" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h3 id="editorToolImageTitle">图片</h3></div><div class="modal-body"><div class="upload-img" style="height: 50px; padding: 60px 0px; text-align: center; border: 4px dashed rgb(221, 221, 221);"><div class="button webuploader-container" style="width: 86px; height: 40px; margin: 0px auto;"><div class="webuploader-pick">上传图片</div><div id="rt_rt_1eci8r00m15itpqd4fc1sn139h1" style="position: absolute; overflow: hidden; bottom: auto; right: auto; width: 86px; height: 40px; top: 0px; left: 0px;"><input type="file" name="file" class="webuploader-element-invisible" accept="image/*"><label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label></div></div><span class="tip" style="display: none;"></span><div class="alert alert-error hide"></div></div></div></div><div class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editorToolImageTitle" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h3 id="editorToolImageTitle">添加链接</h3></div><div class="modal-body"><form class="form-horizontal"><div class="control-group"><label class="control-label">标题</label><div class="controls"><input type="text" name="title" placeholder="Title"></div></div><div class="control-group"><label class="control-label">链接</label><div class="controls"><input type="text" name="link" value="http://" placeholder="Link"></div></div></form></div><div class="modal-footer"><button class="btn btn-primary" role="save">确定</button></div></div>
<div id="backtotop" style="display: none; top: 479px; right: 0px;">回到顶部</div>
<div id="footer">
<#--    <div id="footer_main"> </div>-->
</div>
<div id="sidebar-mask"></div>

<div id="atwho-container"><div id="atwho-ground-336a27a71594046119977"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-80a742ae1594046119981"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-0ac85e7c1594046119982"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-eabdbcb81594046119984"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-6c6eaa9d1594046119984"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-b4108f981594046119985"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-0391cf7c1594046119987"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-0a1a46611594046119990"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-ef70f8411594046120007"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div></div></body>
</html>
