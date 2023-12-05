<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
    ul.navbar {
        list-style: none;
        padding: 0;
        text-align: center; /* 중앙 정렬을 위한 추가 스타일 */
    }

    ul.navbar li {
        display: inline;
        margin-right: 10px; /* 각 항목 간의 간격을 조절할 수 있습니다. */
    }

    ul.navbar li.left {
        float: left; /* 왼쪽 정렬을 위한 스타일 */
    }

    ul.navbar li.right {
        float: right; /* 오른쪽 정렬을 위한 스타일 */
    }
</style>

<ul class="navbar">
    <li class="left"><a href="/project_H/board/list/${page}">목록</a></li>
    <li class="right"><a href="/project_H/board/write">글 작성</a></li>
</ul>
