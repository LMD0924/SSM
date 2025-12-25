<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>课程管理系统 - 课程列表</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .header h1 {
            color: #2c3e50;
            font-size: 28px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }

        .btn-danger {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 8px 16px;
            font-size: 14px;
            border-radius: 4px;
        }

        .btn-edit {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 8px 16px;
            font-size: 14px;
            border-radius: 4px;
            text-decoration: none;
        }

        .btn-logout {
            background: #6c757d;
            color: white;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }

        .btn-logout:hover {
            background: #5a6268;
        }

        .table-container {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }

        tbody tr {
            border-bottom: 1px solid #eee;
            transition: background 0.3s ease;
        }

        tbody tr:hover {
            background: #f8f9fa;
        }

        td {
            padding: 15px;
            color: #333;
        }

        .actions-cell {
            display: flex;
            gap: 10px;
        }

        .empty-message {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 16px;
        }

        .size-badge {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: bold;
        }

        .course-code {
            font-family: 'Courier New', monospace;
            background: #f8f9fa;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 14px;
            color: #495057;
        }

        .search-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .search-input {
            padding: 10px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 5px;
            width: 300px;
            font-size: 14px;
            transition: border 0.3s ease;
        }

        .search-input:focus {
            outline: none;
            border-color: #667eea;
        }

        .btn-search {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-left: 10px;
        }

        .stats {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .stat-card {
            flex: 1;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            text-align: center;
        }

        .stat-card h3 {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        .stat-card .number {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
        }

        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }

            .search-input {
                width: 100%;
                margin-bottom: 10px;
            }

            table {
                display: block;
                overflow-x: auto;
            }

            .stats {
                flex-direction: column;
            }

            .actions-cell {
                flex-direction: column;
                gap: 5px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>📚 课程管理系统</h1>
        <div class="user-info">
            <span>欢迎使用课程管理系统</span>
            <a href="${pageContext.request.contextPath}/logout" class="btn-logout">🚪 退出登录</a>
        </div>
    </div>

    <div class="search-box">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
            <h2 style="color: #2c3e50; font-size: 18px;">课程列表</h2>
            <a href="${pageContext.request.contextPath}/toAddCourse" class="btn btn-primary">
                ➕ 添加新课程
            </a>
        </div>

        <div>
            <input type="text" id="searchInput" class="search-input" placeholder="搜索课程名称、教师或代码...">
            <button class="btn-search" onclick="searchCourses()">🔍 搜索</button>
        </div>
    </div>

    <div class="table-container">
        <c:choose>
            <c:when test="${not empty courses}">
                <table>
                    <thead>
                    <tr>
                        <th width="50">ID</th>
                        <th>课程名称</th>
                        <th>课程代码</th>
                        <th>授课教师</th>
                        <th>课程人数</th>
                        <th>责任教师</th>
                        <th width="180">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="course" items="${courses}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td><strong>${course.courseName}</strong></td>
                            <td><span class="course-code">${course.courseCode}</span></td>
                            <td>${course.courseTeacher}</td>
                            <td>
                                <span class="size-badge">${course.courseSize} 人</span>
                            </td>
                            <td>${course.teacher}</td>
                            <td class="actions-cell">
                                <a href="${pageContext.request.contextPath}/toEditCourse?id=${course.id}"
                                   class="btn-edit">✏️ 编辑</a>
                                <a href="${pageContext.request.contextPath}/deleteCourse?id=${course.id}"
                                   class="btn btn-danger"
                                   onclick="return confirm('确定要删除课程【${course.courseName}】吗？')">🗑️ 删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-message">
                    <p>📭 暂无课程数据</p>
                    <p style="margin-top: 10px; font-size: 14px; color: #999;">
                        点击上方"添加新课程"按钮开始添加课程
                    </p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="stats">
        <div class="stat-card">
            <h3>总课程数</h3>
            <div class="number">${courses.size()}</div>
        </div>
        <div class="stat-card">
            <h3>总学生容量</h3>
            <div class="number">
                <c:set var="totalSize" value="0" />
                <c:forEach var="course" items="${courses}">
                    <c:set var="totalSize" value="${totalSize + course.courseSize}" />
                </c:forEach>
                ${totalSize} 人
            </div>
        </div>
        <div class="stat-card">
            <h3>教师数量</h3>
            <div class="number">
                <c:set var="teacherSet" value="" />
                <c:set var="teacherCount" value="0" />
                <c:forEach var="course" items="${courses}">
                    <c:if test="${not empty course.teacher}">
                        <c:if test="${not fn:contains(teacherSet, course.teacher)}">
                            <c:set var="teacherSet" value="${teacherSet},${course.teacher}" />
                            <c:set var="teacherCount" value="${teacherCount + 1}" />
                        </c:if>
                    </c:if>
                    <c:if test="${not empty course.courseTeacher}">
                        <c:if test="${not fn:contains(teacherSet, course.courseTeacher)}">
                            <c:set var="teacherSet" value="${teacherSet},${course.courseTeacher}" />
                            <c:set var="teacherCount" value="${teacherCount + 1}" />
                        </c:if>
                    </c:if>
                </c:forEach>
                ${teacherCount}
            </div>
        </div>
    </div>
</div>

<script>
    function searchCourses() {
        const searchText = document.getElementById('searchInput').value.toLowerCase();
        const rows = document.querySelectorAll('tbody tr');

        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(searchText) ? '' : 'none';
        });
    }

    // 按Enter键搜索
    document.getElementById('searchInput').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            searchCourses();
        }
    });
</script>
</body>
</html>