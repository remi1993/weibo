<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>修改 Weibo 的页面</title>
</head>
<body>
    <h1>修改 Weibo</h1>
    <form action="/weibo/update" method="post">
        <input name="id" placeholder="id" hidden value="${weibo.id}">
        <input name="content" placeholder="content" value="${weibo.content}">
        <br>
        <button type="submit">提交修改</button>
    </form>
</body>
</html>
