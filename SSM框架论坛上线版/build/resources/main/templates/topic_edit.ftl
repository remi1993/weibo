<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>修改帖子</title>
</head>
<body>
    <h1>修改 帖子</h1>
    <form action="/topic/update" method="post">
        <input name="id" placeholder="id" value="${topic.id}">
        <input name="title" placeholder="title" value="${topic.title}">
        <input name="content" placeholder="content" value="${topic.content}">
        <br>
        <button type="submit">提交修改</button>
    </form>
</body>
</html>
