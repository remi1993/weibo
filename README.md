使用 SpringMVC, SpringBoot，Mybatis（ SSM 框架）开发论坛项目。

采用 MVC 模式：M(Model)控制数据结构，也就是Java中常说的bean，V(View)展示页面数据，通常放在templates静态文件夹中，C（Controller)控制路由路径，实现M和V层的数据交互，MVC框架可使开发代码低耦合，高内聚，开发思路清晰高效，并且能快速调试代码。在学习并开发过程中，发现路由请求代码太长，经过调试后，修改Java的方法引用方式重构路由代码请求方式，节省代码量，方便调试和修改。

使用功能模块包括：用户注册，用户登录，用户权限管理，用户信息显示和修改，使用SMTP邮箱密码重置，显示所有帖子页面，发帖功能，编辑功能，删除功能，评论功能等等。

使用技术包括：SpringBoot 依赖配置，war 包打包配置，端口设置，MySQL 数据库;使用 Spring IOC（控制反转），ID（依赖注入）方式，方便调用实例方法，节省代码量，结构更清晰；使用 AOP (面向切片编程)控制登录权限，新增编辑删除帖子权限；前端使用FreeMarker 模板引擎渲染请求数据，也使用了 AJAX 方式实现无需刷新页面加载数据；在开发路由时，使用动态路由方式。

在开发过程中，接触到了网络安全方面知识，所以加入 Session 和 Token，防范 CSRF 跨站伪造请求攻击，对前端的输入字符进行转义，防范 XSS 跨网站脚本攻击，使用 Mybatis# 字符防范SQL注入，用户密码使用摘要算法和加盐算法，降低用户信息泄漏损失。

用户以游客身份进入主页，在访问todo页面的时候使用AOP (面向切片编程)对用户身份进行判断是否有权访问，
没有访问权跳转至登录页面，
若用户是无账户则选择注册新用户
![image](https://github.com/remi1993/weibo/blob/master/picture/1.%E6%B3%A8%E5%86%8C%E7%99%BB%E5%BD%95.gif)

访问者以普通用户身份进行增删改todo的操作，前后端交互使用了 AJAX 方式实现无需刷新页面加载数据
![image](https://github.com/remi1993/weibo/blob/master/picture/2.todo2.gif)

访问者以普通用户身份查看topic板块所有帖子，
用户发帖，
用户点击帖子标题进入查看帖子详细内容并发表评论，
![image](https://github.com/remi1993/weibo/blob/master/picture/3.topic.gif)

用户对topic进行修改和删除操作
![image](https://github.com/remi1993/weibo/blob/master/picture/3.topic%E5%88%A0%E6%94%B9.gif)

从topic点击作者跳转至个人主页，
个人主页按照时间先后顺序展示了该用户最近回复的topic和最近创建的topic
![image](https://github.com/remi1993/weibo/blob/master/picture/3.topic%E8%B7%B3%E8%BD%AC%E4%B8%AA%E4%BA%BA%E4%B8%BB%E9%A1%B5.gif)

访问weibo页面并添加weibo
![image](https://github.com/remi1993/weibo/blob/master/picture/4.weibo.gif)

用户对微博进行删除和修改操作
![image](https://github.com/remi1993/weibo/blob/master/picture/4.weibo%E5%88%A0%E6%94%B9.gif)
