
<%
response.codepage = 949
response.charset = "EUC-KR"
' response.CodePage = 65001
' response.charset = "UTF-8"
' request ��ü�� ���� �Ѿ�� ���� ������ ����
name = request("name")
email = request("email")
homepage = request("homepage")
title = request("title")
pwd = request("pwd")
board_content = request("board_content")

' connection �ν��Ͻ� ����
set db = Server.CreateObject("ADODB.Connection")
' DB ����
'db.Open("Provider=SQLOLEDB;Data Source=(local)\SQLEXPRESS;Initial Catalog=MyDB;Integrated Security=true;")
'db.Open("Driver={SQL Server};Server=(LocalDb)\MSSQLLocalDB;Database=MyDB;Integrated Security=true;")
'db.Open("Driver={SQL Server};(LocalDb)\MSSQLLocalDB;Initial Catalog=MyDB;Integrated Security=true")
'db.Open("Driver={SQL Server};Server=localsqldb;Initial Catalog=MyDB;Integrated Security=true")
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")

' ���������� �ϴ� ������ ������
sql = "SELECT MAX(num) FROM MyBoard"
' ���ڵ�� ��ü�� �ν��Ͻ� ����
set rs = Server.CreateObject("ADODB.Recordset")
' ������ ������ DB�����ؼ� ���ڵ�¿� ������ ����
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

' db�� insert ������ ���� ������ �߰�
db.execute sql

rs.close
db.close
set rs = nothing
set db = nothing

response.redirect "list.asp"

Response.Write "your name is " & name & "<br>"
Response.Write "���� �ּҴ� " & email & "<br>"
Response.Write "Ȩ������ �ּҴ� " & homepage & "<br>"
Response.Write "�� ������ " & title & "<br>"
Response.Write "�� ������ " & board_content & "<br>"
Response.Write "��й�ȣ�� " & pwd & "<br>" 
%>
<html>
<body>
</body>
</html>