
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
board_idx = request("board_idx")

' connection �ν��Ͻ� ����
Set db = Server.CreateObject("ADODB.Connection")
' DB ����
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")

' ���� ���� ��й�ȣ �������� ��й�ȣ�� üũ
sql = "SELECT pwd FROM MyBoard WHERE board_idx = " & board_idx
Set rs = db.execute(sql)

' ��й�ȣ ��
If Request("pwd") = rs("pwd") Then
    sql = "UPDATE MyBoard SET name = '" & name & ""
    sql = sql & ", title = '" & title & "'"
    sql = sql & ", email = '" & email & "'"
    sql = sql & ", board_content = '" & board_content & "'"
    sql = sql & ", homepage = '" & homepage & "'"
    sql = sql & "WHERE board_idx = " & board_idx

    ' �����͸� ������Ʈ�ϰ� ����Ʈ�� �����̷�Ʈ
    db.execute(sql)
    Response.Redirect("content.asp?idx=" & board_idx)
    
    else
    Response.Write("<script>alert('��й�ȣ�� Ʋ�Ƚ��ϴ�');history.back();</script>")
    End If
%>
<html>
<body>
</body>
</html>