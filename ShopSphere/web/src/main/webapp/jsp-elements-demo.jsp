<%@ page contentType="text/html;charset=UTF-8" %>

<%!
    int visitCount = 0;

    String getMessage() {
        return "Welcome to ShopSphere JSP Demo";
    }
%>

<%
    visitCount++;

    String studentName = "ShopSphere Student";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopSphere - JSP Elements Demo</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
        }

        .box {
            padding: 15px;
            margin: 15px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        code {
            background: #f0f0f0;
            padding: 3px 6px;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>ShopSphere JSP Elements Demonstration</h1>

    <div class="box">
        <h2>1. JSP Declaration</h2>

        <p>
            Method result:
            <strong><%= getMessage() %></strong>
        </p>
    </div>

    <div class="box">
        <h2>2. JSP Scriptlet</h2>

        <p>
            Student Name:
            <strong><%= studentName %></strong>
        </p>

        <p>
            Visit Count:
            <strong><%= visitCount %></strong>
        </p>
    </div>

    <div class="box">
        <h2>3. JSP Expression</h2>

        <p>
            Current Student:
            <strong><%= studentName %></strong>
        </p>
    </div>

    <%--
        4. JSP Comment

        This comment is processed by the JSP container
        and is not sent to the browser.
    --%>

    <div class="box">
        <h2>4. JSP Comment</h2>

        <p>
            JSP comment source mein available hai,
            lekin browser ke HTML source mein nahi dikhega.
        </p>
    </div>

</div>

</body>
</html>