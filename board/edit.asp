<%
response.codepage = 949
response.charset = "EUC-KR"
%>

<%
Set db = Server.CreateObject("ADODB.Connection")
db.Open("DSN=localsqldb; UID=sa; PWD=1234;")

sql = "SELECT * FROM " & session("table") & " WHERE board_idx=" & request("idx")

Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open sql, db
%>

<!DOCTYPE html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/link.css">
    <title>�����ϱ�</title>
</head>
<body>
    <script>
        function sendIt() {
            // �̸�
            if (document.myform.name.value == "") {
                alert("�̸��� �Է����ּ��� ���ߤ���..")
                return false
            }
            
            // ����
            if (document.myform.title.value == "") {
                alert("������ �Է����ּ��� ����..")
                return false
            }
    
            // ����
            if (document.myform.board_content.value == "") {
                alert("������ �ϳ��� ���׿�.. ���� �� �����ּ���..")
                return false
            }
    
            // ��й�ȣ
            if (document.myform.pwd.value == "") {
                alert("����, ������ ��й�ȣ�� �ʿ��ѵ� �����. �Է����ּ���..")
                return false
            }

            document.myform.submit()
        }
    </script>
    <div style="align-items:left">
        <table cellpadding="0" cellspacing="0" style="border:0; width: 700;">
            <tr>
                <td>
                    <form name="myform" method="post" action="edit_ok.asp">
                        <div style="text-align: center;">
                            <table cellpadding="0" cellspacing="0" style="border: 1px dashed rgb(192, 192, 192); width: 540;">
                                <tr>
                                    <td class="write-td-left">
                                        <strong class="write-text-strong">
                                            <img src="https://img.freepik.com/free-vector/illustration-of-document-icon_53876-37007.jpg?w=1380&t=st=1677052922~exp=1677053522~hmac=5f8645b7a869e81c30d37d18ee7ea86d6ac8fbed6e250759cf90abe5ae812e86" width="40px">
                                        </strong>
                                    </td>
                                    <td class="write-td-left">
                                        <strong class="write-text-strong">
                                            �� �����ϱ�
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="write-td-left">
                                        <strong class="write-text-strong">
                                            �۾���
                                        </strong>
                                    </td>
                                    <td class="write-td-right">
                                        <input type="hidden" name="board_idx" value="<%=rs("board_idx")%>">
                                        <input type="text" name="name" size="20" style="border: 1 dashed;" value="<%=rs("name")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="write-td-left">
                                        <strong class="write-text-strong">
                                            �̸���
                                        </strong>
                                    </td>
                                    <td class="write-td-right">
                                        <input type="text" name="email" size="20" style="border: 1 dashed;" value="<%=rs("email")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="write-td-left">
                                        <strong class="write-text-strong">
                                            Ȩ������
                                        </strong>
                                    </td>
                                    <td class="write-td-right">
                                        <strong class="write-text-strong">
                                            <input type="text" name="homepage" size="20" style="border: 1 dashed;" value="<%=rs("homepage")%>">
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="write-td-left">
                                        <strong class="write-text-strong">
                                            ����
                                        </strong>
                                    </td>
                                    <td class="write-td-right">
                                        <input type="text" name="title" size="20" style="border: 1 dashed;" value="<%=rs("title")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="write-td-left">
                                        <strong class="write-text-strong">
                                            ����
                                        </strong>
                                    </td>
                                    <td class="write-td-right">
                                        <textarea wrap="hard" rows="10" name="board_content" cols="55" style="border: 1 dashed;"><%=rs("board_content")%>
                                        </textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="write-td-left">
                                        <strong class="write-text-strong">
                                            ��й�ȣ
                                        </strong>
                                    </td>
                                    <td class="write-td-right">
                                        <input type="password" name="pwd" size="20" style="border: 1 dashed;">
                                        &nbsp;
                                        (������ ������ �ʿ�)
                                    </td>
                                </tr>
                            </table>
                            <p>
                                <input type="button" value="�ۼ� �Ϸ�" onclick="sendIt()">
                                &nbsp;
                                <input type="reset" value="���ۼ��ϱ�" name="reset">
                            </p>
                        </div>
                    </form>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>