<%=Request.QueryString("idx")%>
<%
Set db = Server.CreateObject("ADODB.Connection")
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")

Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM MyBoard WHERE board_idx=" & request("idx")

rs.Open sql, db
%>