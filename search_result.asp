<%
response.codepage = 949
response.charset = "EUC-KR"
%>

<%
if request("page") = "" then
    page = 1
else
    page = request("page")
end if
' �Ѿ�� �� ������ �Ҵ� / �ӵ� ���
search = request("search")
searchString = request("searchString")

set db = Server.CreateObject("ADODB.Connection")
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")

sql = "SELECT * FROM MyBoard WHERE " & search & " LIKE '%" & searchString & "%' ORDER BY num DESC"
'sql = "SELECT * from MyBoard ORDER BY num DESC"

set rs = Server.CreateObject("ADODB.Recordset")
rs.Open sql, db, 1
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=searchString%>�� �˻����</title>
</head>
<body>
    <% if rs.BOF or rs.EOF then %>
    <p>
        <%=searchString%>�� ���� �˻� ����� �����ϴ�.
    </p>
    <% else
    ' �� ���ڵ��� ����
    rs.MoveLast
    ' �� ���ڵ��� ���� ������ ����
    recordCnt = rs.RecordCount
    ' �ٽ� ���ڵ带 ����ġ
    rs.MoveFirst
    %>
    <div>
        <p>
            <%=searchString%>�� �˻��� ��� <%=recordCnt%>���� �����͸� �˻��߽��ϴ�.
        </p>
        <table class="list-table">
            <tr>
                <td class="list-td-01">
                    ��ȣ
                </td>
                <td class="list-td-02">
                    �۾���
                </td>
                <td class="list-td-02">
                    ��¥
                </td>
                <td class="list-td-04">
                    ����
                </td>
                <td class="list-td-01">
                    ��ȸ��
                </td>
            </tr>
            <% i = 1
            Do Until rs.EOF %>
            <tr>
                <td class="list-td-01" style="color: black !important; background-color: #fff !important;">
                    <%=rs("num")%></td>
                <td class="list-td-02" style="color: black !important; background-color: #fff !important;">
                    <a href="mailto:<%=rs("email")%>">
                        <%=rs("name")%>
                    </a>
                </td>
                <td class="list-td-02" style="color: black !important; background-color: #fff !important;"><%=rs("writeday")%></td>
                <td class="list-td-04" style="color: black !important; background-color: #fff !important;">
                    <a href="content.asp?idx=<%=rs("board_idx")%>">
                        <%=rs("title")%>
                    </a>
                </td>
                <td class="list-td-01" style="color: black !important; background-color: #fff !important;"><%=rs("readnum")%></td>
            </tr>
            <%
            ' ���� ���ڵ�� �̵�
            rs.MoveNext 
            ' ���ڵ� ������ Loop ����
            loop 
            %>
            <% end if %>
        </table>
        <hr>
    </div>  
</body>
</html>