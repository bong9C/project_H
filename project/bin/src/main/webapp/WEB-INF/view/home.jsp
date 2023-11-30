<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="common/head.jspf" %>
    <link href="/project/css/login.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles.css"> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container" style="margin-top:1px">
        <div class="row">
            <div class="image-container" style="position: relative;">
                <img src="/project/img/HHH.jpg" alt="HHH" class="background-image">
                <img src="/project/img/book1.png" alt="book1" style="position: absolute; top: 200px; left: 310px; width: 700px; height: 500px; z-index: 1;">
            </div>
        </div>
    </div>
    <%@ include file="common/bottom.jspf" %>

</body>
