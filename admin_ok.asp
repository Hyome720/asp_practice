<% 
response.codepage = 949
response.charset = "EUC-KR"
%>
<% 
id = request("id")
pwd = request("pwd")

if id = "admin" and pwd = "1234" then
    session("id") = "admin"
else
    response.write("<script>alert('������ �α��ο� �����߽��ϴ�');history.back();</script>")
end if
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>������ �α���</title>
</head>
<body>
    <p>�α��� ����!</p>
    <p>�����ڴ� �۵��� ��й�ȣ�� �� �� �վ��</p>
    <p><a href="list.asp">�Խ�������</a></p>
</body>
</html>