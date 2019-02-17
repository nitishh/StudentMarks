<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 4/29/2017
  Time: 7:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Report Card</title>
    <meta name="layout" content="mylayout">
</head>

<body>
<div class="container container-table">
    <div class="row">
        <div>
            <img class="img-responsive" src="${resource(dir: 'images', file: 'school_name.png')}" alt="School Name"/>
        </div>
        <div style="width:400px; float: right;">
            <g:each in="${markInformation}" var="${stud}" status="i">
                <g:if test="${i == 0}">
                    <table style="padding: -5px" class="table">
                        <tr>
                            <td>Student Name:</td>
                            <td>${stud.st.name}</td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>${stud.st.email}</td>
                        </tr>
                        <tr>
                            <td>Batch:</td>
                            <td>${stud.st.batch}</td>
                        </tr>
                        <tr>
                            <td>Roll No.:</td>
                            <td>${stud.st.roll}</td>
                        </tr>
                    </table>
                </g:if>
            </g:each>
        </div>
        <div style="float: right;">
            <g:each in="${markInformation}" var="${stud}" status="i">
                <g:if test="${i==0}">
                    <g:img class="img-responsive img-circle" dir="images/student/${stud.st.batch}" file="${stud.st.image}" width="150"></g:img>
                </g:if>
            </g:each>
        </div>
    </div>
    <div class="row">
        <table class="table">
            <thead>
            <tr class="tblheader">
                <th>S.N</th>
                <th>Subject</th>
                <th>Total Mark</th>
                <th>Mark Obtained</th>
            </tr>
            </thead>
            <tbody>
                <g:each in="${markInformation}" var="${mark}" status="i">
                    <tr class="tblrow">
                        <td>${i + 1}</td>
                        <td>${mark.sj.name}</td>
                        <td>${mark.sj.total_mark}</td>
                        <g:if test="${mark.marks < 40}">
                            <td class="failed">${mark.marks}</td>
                        </g:if>
                        <g:if test="${mark.marks >= 40}">
                            <td>${mark.marks}</td>
                        </g:if>

                    </tr>
                </g:each>
                <tr style="border-bottom:1pt solid black; border-top:1pt solid black;">
                    <td colspan="2" style="text-align: right; font-weight: bold">Total</td>
                    <td>${totalMark}</td>
                    <td>${markObtained}</td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: right; font-weight: bold">Percentage</td>
                    <td>${percentage}%</td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: right; font-weight: bold">Result</td>
                    <g:if test="${res == 'FAILED'}">
                        <td class="failed" style="font-weight: bold">${res}</td>
                    </g:if>
                    <g:if test="${res == 'PASSED'}">
                        <td style="font-weight: bold">${res}</td>
                    </g:if>

                </tr>
            </tbody>

        </table>
    </div>
    </div>
</body>
</html>