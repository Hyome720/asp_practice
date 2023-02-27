<%
response.codepage = 949
response.charset = "EUC-KR"
%>

<%
if session("id") = "" then
    Response.Redirect("../default.asp")
end if %>

<%
Set db = Server.CreateObject("ADODB.Connection")
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")

sql = "SELECT * FROM MemberList WHERE mem_idx = '" & session("idx") & "'"

Set rs = db.execute(sql)

name = rs("mem_name")
id = rs("mem_id")
pwd = rs("mem_pwd")
ssn1 = left(rs("mem_ssn"), 6)
ssn2 = right(rs("mem_ssn2"), 7)
sex = rs("mem_sex")
job = rs("mem_job")
email = rs("mem_email")
intro = rs("mem_intro")

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        function sendIt() {
            let str
            str = document.registerForm.mem_name.value
            if (str == "") {
                alert("�̸��� �Է����ּ���")
                document.registerForm.mem_name.focus()
                return true
            }

            str = document.registerForm.mem_id.value
            if (str == "" || str.length < 4) {
                alert("���̵� �Է����� �����̰ų� 4���� �̸��Դϴ�.")
                document.registerForm.mem_id.focus()
                return true
            }

            str = document.registerForm.mem_pwd1.value
            if (str == "" || str.length < 6) {
                alert("��й�ȣ�� �Է����� �����̰ų� 6���� �̸��Դϴ�.")
                document.registerForm.mem_pwd1.focus()
                return true
            }

            if (document.registerForm.mem_pwd1.value != document.registerForm.mem_pwd2.value) {
                alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� Ȯ�����ּ���")
                document.registerForm.mem_pwd2.focus()
                return true
            }

            str = document.registerForm.mem_email.value
            if (str == "") {
                alert("���� �ּҸ� �Է����ּ���")
                document.registerForm.mem_email.focus()
                return true
            }

            const ssn1 = document.registerForm.mem_ssn1.value
            const ssn2 = document.registerForm.mem_ssn2.value

            if (ssn1.length != 6 || ssn2.length != 7) {
                alert("�ֹε�Ϲ�ȣ�� �̻��ؿ�")
                document.registerForm.ssn1.focus()
                return true
            }

            document.registerForm.submit()
            return true
        }

        function onlyNumber() {
            if(event.keyCode < 48 || event.keyCode > 57) {
                event.returnValue = false
                alert('���ڸ� �Է°����մϴ�!')
                document.registerForm.focus.ssn1.focus()
            }
        }
    </script>
    <form name="registerForm" method="post" action="mem_edit_ok.asp">
        <h2>�������� ����</h2>
        <table>
            <tr>
                <td>
                    <p>����� ID</p>
                </td>
                <td>
                    <input type="text" name="id" value="id" disabled>
                </td>
            </tr>
            <tr>
                <td>
                    <p>�̸�</p>
                </td>
                <td>
                    <input type="text" name="name" value="name" maxlength="10">
                </td>
            </tr>
            <tr>
                <td>
                    <p>��й�ȣ</p>
                </td>
                <td>
                    <input type="password" name="pwd1" value="pwd" maxlength="20">
                </td>
            </tr>
            <tr>
                <td>
                    <p>��й�ȣ Ȯ��</p>
                </td>
                <td>
                    <input type="password" name="pwd2" value="pwd" maxlength="20">
                </td>
            </tr>
            <tr>
                <td>
                    <p>�ֹε�Ϲ�ȣ</p>
                </td>
                <td>
                    <input type="text" name="ssn1" value="ssn1" maxlength="6" onKeyPress="onlyNumber()">
                    -
                    <input type="text" name="ssn2" value="ssn2" maxlength="7" onKeyPress="onlyNumber()">
                </td>
            </tr>
            <tr>
                <td>
                    <p>����</p>
                </td>
                <td>
                    <input type="radio" name="sex" value="male" <% if sex="male" then %>checked<% end if %>>����
                    <input type="radio" name="sex" value="female" <% if sex="female" then %>checked<% end if %>>����
                </td>
            </tr>
            <tr>
                <td>
                    <p>����</p>
                </td>
                <td>
                    <select name="job" size="1">
                        <option value="not" <% if job = "not" then %>selected<% end if %>>���� ���� �Ͻó���?</option>
                        <option value="������" <% if job = "������" then %>selected<% end if %>>������</option>
                        <option value="�л�" <% if job = "�л�" then %>selected<% end if %>>�л�</option>
                        <option value="����" <% if job = "����" then %>selected<% end if %>>����</option>
                        <option value="���п���" <% if job = "���п���" then %>selected<% end if %>>���п���</option>
                        <option value="����" <% if job = "����" then %>selected<% end if %>>����</option>
                        <option value="��Ÿ" <% if job = "��Ÿ" then %>selected<% end if %>>��Ÿ</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <p>�̸��� �ּ�</p>
                </td>
                <td>
                    <input type="text" size="32" name="email" value="email" maxlength="30">
                </td>
            </tr>
            <tr>
                <td>
                    <p>�̸�</p>
                </td>
                <td>
                    <textarea name="intro" cols="30" rows="20" wrap="physical" value="intro"></textarea>
                </td>
            </tr>
            <div>
                <input type="button" value="ȸ�� ����" name="B1" onClick="sendIt()">
                <input type="button" value="���� ���" onClick="history.back()">
            </div>
        </table>
    </form>
</body>
</html>