<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加课程</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            width: 100%;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        .header p {
            opacity: 0.9;
            font-size: 14px;
        }

        .form-container {
            padding: 40px;
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
        }

        .form-group {
            flex: 1;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #2c3e50;
            font-weight: 600;
            font-size: 14px;
        }

        .required::after {
            content: " *";
            color: #f44336;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid #eee;
        }

        .btn {
            flex: 1;
            padding: 14px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-secondary {
            background: #f8f9fa;
            color: #495057;
            border: 1px solid #dee2e6;
        }

        .btn-secondary:hover {
            background: #e9ecef;
            border-color: #ced4da;
        }

        .hint {
            font-size: 12px;
            color: #6c757d;
            margin-top: 5px;
            display: block;
        }

        .form-tips {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 13px;
            color: #6c757d;
            border-left: 4px solid #667eea;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                gap: 15px;
            }

            .btn-group {
                flex-direction: column;
            }

            .form-container {
                padding: 25px;
            }

            .header {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>添加新课程</h1>
        <p>请填写以下课程信息</p>
    </div>

    <div class="form-container">
        <div class="form-tips">
            💡 提示：所有带 * 的字段为必填项
        </div>

        <form action="${pageContext.request.contextPath}/insertCourse" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="courseCode" class="required">课程代码</label>
                    <input type="text" id="courseCode" name="courseCode" required
                           placeholder="例如：CS101">
                    <span class="hint">课程的唯一标识代码</span>
                </div>

                <div class="form-group">
                    <label for="courseName" class="required">课程名称</label>
                    <input type="text" id="courseName" name="courseName" required
                           placeholder="例如：数据结构">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="courseTeacher" class="required">授课教师</label>
                    <input type="text" id="courseTeacher" name="courseTeacher" required
                           placeholder="例如：张三教授">
                </div>

                <div class="form-group">
                    <label for="courseSize" class="required">课程人数</label>
                    <input type="number" id="courseSize" name="courseSize"
                           min="1" max="500" step="1" required
                           placeholder="例如：60">
                    <span class="hint">最大可容纳的学生人数</span>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="teacher">责任教师</label>
                    <input type="text" id="teacher" name="teacher"
                           placeholder="不填则与授课教师相同">
                </div>
            </div>

            <div class="btn-group">
                <a href="${pageContext.request.contextPath}/courseList" class="btn btn-secondary">
                    ← 返回列表
                </a>
                <button type="submit" class="btn btn-primary">
                    ✅ 添加课程
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    // 自动填充责任教师为授课教师
    document.getElementById('courseTeacher').addEventListener('blur', function() {
        const teacherField = document.getElementById('teacher');
        if (!teacherField.value) {
            teacherField.value = this.value;
        }
    });

    // 表单验证
    document.querySelector('form').addEventListener('submit', function(e) {
        const courseSize = document.getElementById('courseSize').value;
        if (courseSize < 1 || courseSize > 500) {
            alert('课程人数必须在1-500之间');
            e.preventDefault();
            return false;
        }
        return true;
    });
</script>
</body>
</html>