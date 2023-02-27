<% 
response.codepage = 949
response.charset = "EUC-KR"
%>
<%
' ������ ����
' default �������� ù �������� ����
' �Ѿ���� �������� �ִٸ� �� ��ȣ�� ����
' �� ��ȣ�� Absolutepage�� ����
if request("page") = "" then
    page = 1
else
    page = request("page")
end if

' connection �ν��Ͻ� ����
Set db = Server.CreateObject("ADODB.Connection")
' DB ����
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")
' ��� ������ ��������
sql = "SELECT * from MyBoard ORDER BY num DESC"
' ���ڵ�� ��ü�� �ν��Ͻ� ����
Set rs = Server.CreateObject("ADODB.Recordset")
' ������ ������ ����. ���ڵ�� ���� ���� ����
rs.pageSize = 3
' ���� ������ DB�����ϰ� ���ڵ�¿� ����
rs.Open sql, db, 1
%>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/list.css">
    <title>�Խ���</title>
</head>
<body>
    <div style="text-align: center;">
        <div>
            <form method="post" action="search_result.asp">
                <table>
                    <tr>
                        <td>
                            <span>�˻�</span>
                        </td>
                        <select name="search">
                            <option value="title">����</option>
                            <option value="name">�۾���</option>
                            <option value="content">����</option>
                        </select>
                        <input type="text" name="searchString">
                        <input type="submit" value="�˻�">
                    </tr>
                </table>
            </form>
        </div>
        <hr>
        <p style="color: #004080">
            <strong>
                MyBoard List
            </strong>
            &nbsp;
            &nbsp;
            &nbsp;
            <a href="write.html">
                <img src="https://img.freepik.com/free-vector/illustration-of-document-icon_53876-37007.jpg?w=1380&t=st=1677052922~exp=1677053522~hmac=5f8645b7a869e81c30d37d18ee7ea86d6ac8fbed6e250759cf90abe5ae812e86" width="40px">
                �� �ۼ��ϱ�
            </a>
        </p>
    </div>
    <% 
    if rs.BOF or rs.EOF then
    %>
    <p>�����Ͱ� �����ϴ٤�������������.</p>
    <% else 
        ' �� �������� ������ �Ҵ�
        totalPage = rs.pageCount
        rs.absolutePage = page
    %>
        <div style="text-align: center;">
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
                Do Until rs.EOF or i > rs.pageSize %>
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
                i = i + 1
                ' ���ڵ� ������ Loop ����
                loop 
                %>
                <% end if %>
            </table>
            <hr>
            <% if page <> 1 then %>
            &lt; <a href="list.asp?page=<%=page - 1%>">���� ������</a> &gt;
            <% end if %>
            <% if Cint(page) <> Cint(totalPage) then %>
            &lt; <a href="list.asp?page=<%=page + 1%>">���� ������</a> &gt;
            <% end if %>
            <br>
            <%=page%> ������ / <%=totalPage%> ������
        </div>
</body>
</html>

<%
' ����� ��ü�� ��� �ݳ� - ������ ����
rs.Close
db.Close
Set rs= Nothing
Set db = Nothing
%>