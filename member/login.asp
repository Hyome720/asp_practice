<%
NewMember = request("NewMember")
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div>
        <div>
            <p>�α���</p>
        </div>
        <div>
            <form method="post" action="login_ok.asp">
                <div>
                    <table>
                        <tr>
                            <td>
                                <span>ID :</span>
                                <input type="text" name="mem_id" value="<%=NewMember%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>��й�ȣ :</span>
                                <input type="password" name="mem_pwd">
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <input type="submit" value="�α���">
                </div>
            </form>
            <p>
                <span>���� ���̵� �����Ű���?</span>
                <a href=register.html>ȸ������ �Ϸ�����</a>
            </p>
        </div>
    </div>
</body>
</html>