<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ Language=VBScript CodePage=65001 %>
</head>
<body>
<%
Dim myArray()
ReDim MyArray(3)

MyArray(0) = "효상"
MyArray(1) = "shinan"
MyArray(2) = "Testing"

ReDim preserve MyArray(4)

for i = 0 to 3
Response.Write MyArray(i) & "test<br>"
Next
%>
    
</body>
</html>