<%
response.codepage = 949
response.charset = "EUC-KR"
%>

<%=Request.QueryString("idx")%>
<%
Set db = Server.CreateObject("ADODB.Connection")
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")

Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM " & session("table") & " WHERE board_idx=" & request("idx")

rs.Open sql, db
%>

<!DOCTYPE html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=rs("title")%> ����</title>
    <link rel="stylesheet" href="./css/content.css">
</head>
<body>
    <div style="margin: auto;">
        <h2><%=rs("title")%> ����</h2>
        <div>
            <div>
                <table class="content-table">
                    <tr>
                        <td class="td-100 td-left">
                            <p class="td-text">�۾���</p>
                        </td>
                        <td class="td-100 td-right">
                            <p><%=rs("name")%></p>
                        </td>
                        <td class="td-100 td-left">
                            <p class="td-text">��¥</p>
                        </td>
                        <td class="td-100 td-right">
                            <p><%=rs("writeday")%></p>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-100 td-left">
                            <p class="td-text">�̸���</p>
                        </td>
                        <td class="td-180 td-right">
                            <a href="mailto:<%=rs("email")%>"><%=rs("email")%></a>
                        </td>
                        <td class="td-100 td-left">
                            <p class="td-text">Ȩ������</p>
                        </td>
                        <td class="td-180 td-right">
                            <a href="<%=rs("homepage")%>">
                                <%=rs("name")%>���� Ȩ������
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-100 td-left">
                            <p class="td-text">��ȸ�� : </p>
                        </td>
                        <td>
                            <p><%=rs("readnum")%></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>���� : </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><%=rs("board_content")%></p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <a href="list.asp">
            <p>
                ����Ʈ�� ���ư���
            </p>
        </a>
        <a href="edit.asp?idx=<%=rs("board_idx")%>">
            <p>
                ����
            </p>
        </a>
        <a href="del.asp?idx=<%=rs("board_idx")%>">
            <p>
                ����
            </p>
        </a>
        <% if session("id") = "admin" then%>
        <p>������� ��й�ȣ : <%=rs("pwd")%></p>
        <% end if %>
    </div>
</body>
</html>