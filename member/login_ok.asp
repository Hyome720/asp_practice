<%
response.codepage = 949
response.charset = "EUC-KR"
%>

<%
Set db = Server.CreateObject("ADODB.Connection")
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")

Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT mem_id, mem_name, mem_pwd, mem_email FROM MemberList"
sql = sql & " WHERE mem_id = '" & request("mem_id") & "'"

rs.Open sql, db

if (rs.EOF or rs.BOF) then
%>
<script>
    alert("��ϵ��� ���� ���̵� �Դϴ�. ���̵� Ȯ�����ּ���")
    history.back()
</script>

<% else
    if rs("mem_pwd") <> request("mem_pwd") then
%>
    <script>
        alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�. ��й�ȣ�� Ȯ�����ּ���.")
        history.back()
    </script>

    <% else
        session("idx") = rs("mem_idx")
        session("id") = rs("mem_id")
        session("name") = rs("mem_name")
        session("email") = rs("mem_email")
        Response.Redirect("main.asp")
    end if
end if %>