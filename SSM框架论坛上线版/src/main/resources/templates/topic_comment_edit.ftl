<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>修改帖子评论</title>
</head>
<body>
    <h1>修改 评论</h1>
    <form action="/topiccomment/update" method="post">
        <input name="id" placeholder="id" value="${topiccomment.id}">
        <input name="topicId" placeholder="topicId" value="${topiccomment.topicId}">
        <input name="content" placeholder="content" value="${topiccomment.content}">
        <br>
        <button type="submit">提交修改</button>
    </form>
</body>
</html>
