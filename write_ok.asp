
<%
response.codepage = 949
response.charset = "EUC-KR"
' response.CodePage = 65001
' response.charset = "UTF-8"
' request 개체를 통해 넘어온 값을 변수에 저장
name = request("name")
email = request("email")
homepage = request("homepage")
title = request("title")
pwd = request("pwd")
board_content = request("board_content")

' connection 인스턴스 생성
set db = Server.CreateObject("ADODB.Connection")
' DB 열기
'db.Open("Provider=SQLOLEDB;Data Source=(local)\SQLEXPRESS;Initial Catalog=MyDB;Integrated Security=true;")
'db.Open("Driver={SQL Server};Server=(LocalDb)\MSSQLLocalDB;Database=MyDB;Integrated Security=true;")
'db.Open("Driver={SQL Server};(LocalDb)\MSSQLLocalDB;Initial Catalog=MyDB;Integrated Security=true")
'db.Open("Driver={SQL Server};Server=localsqldb;Initial Catalog=MyDB;Integrated Security=true")
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")

' 가져오려고 하는 데이터 쿼리문
sql = "select MAX(num) from MyBoard"
' 레코드셋 개체의 인스턴스 생성
set rs = Server.CreateObject("ADODB.Recordset")
' 지정한 쿼리로 DB연결에서 레코드셋에 데이터 저장
rs.Open sql, db

if isNull(rs(0)) then
    number = 1
else
    number = rs(0) + 1
end if

sql = "insert into MyBoard (name, email, homepage, title, board_content, num,"
sql = sql & "readnum, writeday, pwd) values "
sql = sql & "('" & name & "'"
sql = sql & ",'" & email & "'"
sql = sql & ",'" & homepage & "'"
sql = sql & ",'" & title & "'"
sql = sql & ",'" & board_content & "'"
sql = sql & "," & number
sql = sql & ",0,'" & date() & "'"
sql = sql & ",'" & pwd & "')"

' db에 insert 쿼리를 보내 데이터 추가
db.execute sql

rs.close
db.close
set rs = nothing
set db = nothing

response.redirect "list.asp"

Response.Write "your name is " & name & "<br>"
Response.Write "메일 주소는 " & email & "<br>"
Response.Write "홈페이지 주소는 " & homepage & "<br>"
Response.Write "글 제목은 " & title & "<br>"
Response.Write "글 내용은 " & board_content & "<br>"
Response.Write "비밀번호는 " & pwd & "<br>" 
%>
<html>
<body>
</body>
</html>