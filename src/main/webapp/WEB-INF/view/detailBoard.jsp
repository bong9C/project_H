<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	<meta charset="UTF-8">
    <title>board</title>
    <link rel="stylesheet" th:href="@{/css/style.css}"/>
	 	
	 	<title>상세내용</title>
	</head>
	
	<body>
    <div class="container">
        <h2>게시글 목록</h2>
        <table class="board_list">
            <colgroup>
                <col width="15%"/>
                <col width="*"/>
                <col width="15%"/>
                <col width="20%"/>
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">글번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">조회수</th>
                    <th scope="col">작성일</th>
                </tr>
            </thead>
            <tbody>
                <tr th:if="${#lists.size(list)} > 0" th:each="list : ${list}">
                    <td th:text="${list.boardIdx}"></td>
                    <td class="title" th:text="${list.title}"></td>
                    <td th:text="${#temporals.format(list.createdDatetime, 
                        'yyyy-MM-dd HH:mm::ss')}"></td>
                </tr> 
                <tr th:unless="${#lists.size(list)} > 0">
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </tbody>
        </table>
        <a href="/board/openBoardWrite.do" class="btn">글 쓰기</a>
    </div>
</body>
</html>