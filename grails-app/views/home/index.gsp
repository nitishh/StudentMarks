<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 4/29/2017
  Time: 7:13 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Result</title>
    <meta name="layout" content="mylayout">

    <style type="text/css">
        body{background: #eee url(${resource(dir: 'images', file: 'bodybackground.png')});}
    </style>
</head>

<body>
<div class="container">
    <div class="login-container">
        <div id="output"></div>
        <div style="width:100px; height: 100px; margin-left: 50px;">
            <img class="img-responsive img-circle" src="${resource(dir: 'images', file: 'school_logo.png')}" alt="School Logo"/>
        </div>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}

            </div>
        </g:if>
        <div class="form-box">
            <g:form action="result" method="get">
                <g:textField name="batch" required="" placeholder="Batch"></g:textField>
                <g:textField name="rollno" required="" placeholder="RollNo"></g:textField>
                <button class="btn btn-info btn-block login" type="submit" name="submit" id="submit">Submit</button>
                %{--<input type="button" value="Go Ajax" onclick="show_result()">--}%
            </g:form>
        </div>
    </div>
    <div id="div_show_result"></div>
</div>

<script type="application/javascript">
    function show_result() {
//        alert("i am here");
        var roll_no = $("#rollno").val();
        var batch = $("#batch").val();
        var ajaxurl = "${createLink(controller: "home", action: "showAjax")}"
        $.ajax({
            url: ajaxurl,
            method: "POST",
            data: "batch=" + batch + "&rollno=" + roll_no,
            success: function (msg) {
                $("#div_show_result").html(msg)
            }
        })
    }
</script>
</body>
</html>