<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 쓰기</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }

        .container {
            width: 60%;
            margin: 50px auto;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        label {
            font-weight: bold;
        }

        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>글 쓰기</h2>
        <!-- Spring의 form 태그를 사용 -->
        <form:form action="${pageContext.request.contextPath}/board/write" method="post" modelAttribute="board">
            <!-- 폼 필드 -->
            <label for="title">제목:</label>
            <form:input path="title" id="title" required="true" />

            <label for="content">내용:</label>
            <form:textarea path="content" id="content" rows="4" required="true" />

            <!-- bid와 custId는 hidden 필드로 전송 -->
            <form:hidden path="bid" />
            <form:hidden path="custId" value="${session.getAttribute('custId')}" />

            <button type="submit">글 등록</button>
        </form:form>
        <a href="${pageContext.request.contextPath}/board/list/1">게시글 목록으로 돌아가기</a>
    </div>
</body>
</html>
