<%
response.codepage = 949
response.charset = "EUC-KR"
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><=%request("title") �����ϱ�></title>
</head>
<body>
    <p>
        <br>
        <form method="post" action="del_ok.asp">
            <div>
                <tr>
                    <td>
                        <p>�����ϱ�</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>��й�ȣ�� �Է����ּ���</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="idx" value="<%=request("idx")%>">
                        <p>��й�ȣ : &nbsp;
                            <input type="password" name="pwd">
                        </p>
                    </td>
                </tr>
            </div>
            <div>
                <input type="submit" value="����">
                &nbsp;
                &nbsp;
                <span>
                    <a href="content.asp?idx=<%=request("idx")%>">���ư���</a>
                </span>
            </div>
        </form>
    </p>
</body>
</html>