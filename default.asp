<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>���� ����Ʈ</h2>
    <ul>
        <li>����Ʈ �Ұ�</li>
        <li>�Խ���</li>
        <li>�ڷ��</li>

        <% if session("id") = "" then %>
        <li><a href="member/login.asp">�α����ϱ�</a></li>
        <% else %>
        <li><a href="member/mem_edit.asp">������������</a></li>
        <li><a href="member/mem_del.asp">ȸ��Ż��</a></li>
        <% end if %>
    </ul>
</body>
</html>