<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>게시판</title>
    <style>
        /* 추가한 CSS 스타일 */
        .search-container {
            margin-bottom: 80px; /* 검색창과 게시글 리스트 간격 조절 */
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>자유 게시판</h1>
        </header>
        <hr />
        <div>
        </div>
        <section id="container">
            <form role="form" method="get">
                <div class="search row search-container">
                    <div class="col-xs-2 col-sm-2">
                        <select name="searchType" class="form-control">
                            <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
                            <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
                            <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
                            <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
                            <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
                        </select>
                    </div>
                    <div class="col-xs-10 col-sm-10">
                        <div class="input-group">
                            <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
                            <span class="input-group-btn">
                                <button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
                            </span>
                        </div>
                    </div>
                    <script>
                         $(function(){
                             $('#searchBtn').click(function() {
                                 self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
                             });
                         });   
                    </script>
                </div>
                <div class="row justify-content-center">
                    <table class="ui celled table" border="1">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일자</th>
                                <th>공감수</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <c:forEach items="${boardList}" var="board">
                            <tr>
                                <td>${board.bid}</td>
                                <td>
                                    <a class="board-link" href="/project_H/board/view/${board.bid}">${board.title}</a>
                                </td>
                                <td><c:out value="${board.nickname}" /></td>
                                <td><fmt:formatDate value="${board.modTime}" pattern="yyyy-MM-dd"/></td>
                                <td><c:out value="${board.hitCount}" /></td>
                                <td><c:out value="${board.viewCount}" /></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="col-md-offset-3" style="margin-bottom: 20px;">

				    <ul class="pagination">
				        <c:if test="${pageList.size() > 1}">
				            <c:forEach var="pageNum" items="${pageList}">
				                <li class="<c:if test='${pageNum eq pageMaker.currentPage}'>active</c:if>">
				                    <a href="/project_H/board/list/${pageNum}${pageMaker.makeQuery(pageNum)}">${pageNum}</a>

				                </li>
				            </c:forEach>
				        </c:if>
				    </ul>
				</div>
			<%@include file="nav.jsp" %>
             
            </form>
        </section>
    </div>
</body>
</html>
