<% 
response.codepage = 949
response.charset = "EUC-KR"
%>
<%
' 凪戚走 走舛
' default 凪戚走研 湛 凪戚走稽 走舛
' 角嬢神澗 凪戚走亜 赤陥檎 益 腰硲稽 室特
' 戚 腰硲亜 Absolutepage稽 走舛
if request("page") = "" then
    page = 1
else
    page = request("page")
end if

' connection 昔什渡什 持失
Set db = Server.CreateObject("ADODB.Connection")
' DB 伸奄
db.Open("DSN=localsqldb;UID=sa;PWD=1234;")
' 乞窮 汽戚斗 亜閃神奄
sql = "SELECT * from " & session("table") & " ORDER BY num DESC"
' 傾坪球実 鯵端税 昔什渡什 持失
Set rs = Server.CreateObject("ADODB.Recordset")
' 凪戚走 紫戚綜 走舛. 傾坪球実 神蚤 穿拭 走舛
rs.pageSize = 3
' 走舛 汀軒稽 DB尻衣馬壱 傾坪球実拭 煽舌
rs.Open sql, db, 1
%>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/list.css">
    <title>惟獣毒</title>
</head>
<body>
    <div style="text-align: center;">
        <div>
            <form method="post" action="search_result.asp">
                <table>
                    <tr>
                        <td>
                            <span>伊事</span>
                        </td>
                        <select name="search">
                            <option value="title">薦鯉</option>
                            <option value="name">越彰戚</option>
                            <option value="board_content">鎧遂</option>
                        </select>
                        <input type="text" name="searchString">
                        <input type="submit" value="伊事">
                    </tr>
                </table>
            </form>
        </div>
        <hr>
        <p style="color: #004080">
            <strong>
                <%=session("table")%> List
            </strong>
            &nbsp;
            &nbsp;
            &nbsp;
            <a href="write.html">
                <img src="https://img.freepik.com/free-vector/illustration-of-document-icon_53876-37007.jpg?w=1380&t=st=1677052922~exp=1677053522~hmac=5f8645b7a869e81c30d37d18ee7ea86d6ac8fbed6e250759cf90abe5ae812e86" width="40px">
                越 拙失馬奄
            </a>
        </p>
    </div>
    <% 
    if rs.BOF or rs.EOF then
    %>
    <p>汽戚斗亜 蒸柔艦陥たたたたたたた.</p>
    <% else 
        ' 恥 凪戚走呪 痕呪拭 拝雁
        totalPage = rs.pageCount
        rs.absolutePage = page
    %>
        <div style="text-align: center;">
            <table class="list-table">
                <tr>
                    <td class="list-td-01">
                        腰硲
                    </td>
                    <td class="list-td-02">
                        越彰戚
                    </td>
                    <td class="list-td-02">
                        劾促
                    </td>
                    <td class="list-td-04">
                        薦鯉
                    </td>
                    <td class="list-td-01">
                        繕噺呪
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
                ' 陥製 傾坪球稽 戚疑
                rs.MoveNext 
                i = i + 1
                ' 傾坪球 魁猿走 Loop 宜奄
                loop 
                %>
                <% end if %>
            </table>
            <hr>
            <% if page <> 1 then %>
            &lt; <a href="list.asp?page=<%=page - 1%>">戚穿 凪戚走</a> &gt;
            <% end if %>
            <% if Cint(page) <> Cint(totalPage) then %>
            &lt; <a href="list.asp?page=<%=page + 1%>">陥製 凪戚走</a> &gt;
            <% end if %>
            <br>
            <%=page%> 凪戚走 / <%=totalPage%> 凪戚走
        </div>
</body>
</html>

<%
' 紫遂廃 鯵端級 乞砧 鋼崖 - 汽戚斗 箭鉦
rs.Close
db.Close
Set rs= Nothing
Set db = Nothing
%>