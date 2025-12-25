<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SSM课程管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            text-align: center;
            background-color: white;
            padding: 60px 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        p {
            color: #666;
            margin-bottom: 40px;
        }
        .btn {
            display: inline-block;
            padding: 15px 30px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 18px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-login {
            margin-right: 20px;
        }
        .btn-register {
            background-color: #2196F3;
        }
        .btn-register:hover {
            background-color: #0b7dda;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>欢迎使用SSM课程管理系统</h1>
    <p>一个基于Spring + Spring MVC + MyBatis的课程管理系统</p>
    <div>
        <a href="${pageContext.request.contextPath}/toLogin" class="btn btn-login">登录</a>
        <a href="${pageContext.request.contextPath}/toRegister" class="btn btn-register">注册</a>
    </div>
</div>
</body>
</html>