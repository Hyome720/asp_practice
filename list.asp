<% 
response.CodePage = 65001
response.charset = "UTF-8"
%>
<%
' connection 인스턴스 생성
Set db = Server.CreateObject("ADODB.Connection")
' DB 열기
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")
' 모든 데이터 가져오기
sql = "SELECT * from MyBoard ORDER BY num DESC"
' 레코드셋 개체의 인스턴스 생성
Set rs = Server.CreateObject("ADODB.Recordset")
' 지정 쿼리로 DB연결하고 레코드셋에 저장
rs.Open sql, db, 1
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/list.css">
    <title>게시판</title>
</head>
<body>
    <div style="text-align: center;">
        <p style="color: #004080">
            <strong>
                MyBoard List
            </strong>
        </p>
    </div>
    <% 
    if rs.BOF or rs.EOF then
    %>
    <p>데이터가 없습니다ㅏㅏㅏㅏㅏㅏㅏ.</p>
    <% else %>
        <div style="text-align: center;">
            <table>
                <tr>
                    <td class="list-td-01">
                        번호
                    </td>
                    <td class="list-td-02">
                        글쓴이
                    </td>
                    <td class="list-td-02">
                        날짜
                    </td>
                    <td class="list-td-04">
                        제목
                    </td>
                    <td class="list-td-01">
                        조회수
                    </td>
                </tr>
                <% Do Until rs.EOF %>
                <tr>
                    <td class="list-td-01" style="color: black !important; background-color: #fff !important;"><%=rs("num")%></td>
                    <td class="list-td-02" style="color: black !important; background-color: #fff !important;"><%=rs("name")%></td>
                    <td class="list-td-02" style="color: black !important; background-color: #fff !important;"><%=rs("writeday")%></td>
                    <td class="list-td-04" style="color: black !important; background-color: #fff !important;"><%=rs("title")%></td>
                    <td class="list-td-01" style="color: black !important; background-color: #fff !important;"><%=rs("readnum")%></td>
                </tr>
                <%
                rs.MoveNext ' 다음 레코드로 이동
                loop ' 레코드 끝까지 Loop 돌기
                %>
                <% end if %>
            </table>
        </div>
</body>
</html>

<%
' 사용한 개체들 모두 반납 - 데이터 절약
rs.Close
db.Close
Set rs= Nothing
Set db = Nothing
%>