<!--#include file="conn.asp"-->
<!--#include file="md5.asp"-->
<%
if Request.QueryString("tj")="logout" then
response.cookies("admin")=""
response.cookies("flag")=""
response.Write "<script language='javascript'>alert('���ѳɹ�ע����½')</script>"
response.redirect "login.asp"
end if
%>

<%
if Request.Form("Submit")<>"" then
'�����ж��������֤���Ƿ���ȷ 
dim verifycode3,verifycode2 
verifycode3=trim(Request.Form("verifycode")) 
verifycode2=trim(Request.Form("verifycode2")) 
if verifycode3<>verifycode2 then 
response.write"<SCRIPT language=JavaScript>alert('���������֤�벻��ȷ��');" 
response.write"location.href='login.asp'</SCRIPT>" 
else 
session("verifycode")="" 
dim admin,password
admin=replace(trim(request("admin")),"'","")
password=md5(replace(trim(request("password")),"'",""))

set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from wq_admin where admin='"&admin&"' and password='"&password&"' " ,conn,1,1
if not(rs.bof and rs.eof) then
if password=trim(rs("password")) then
response.cookies("admin")=trim(rs("admin"))
response.cookies("flag")=int(rs("flag"))
rs.Close
set rs=nothing

response.Redirect "admin_index.asp"
else
response.write "<script LANGUAGE='javascript'>alert('��½ʧ�ܣ��������ĵ�½�������룡');history.go(-1);</script>"
end if
else
response.write "<script LANGUAGE='javascript'>alert('��½ʧ�ܣ��������ĵ�½�������룡');history.go(-1);</script>"
end if
end if
end if
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��̨����ϵͳ��½</title>
<link rel="stylesheet" type="text/css" href="images/style.css"/>
</head>
<body>
<div id="top"></div>
<form id="frm" name="frm" method="post" action="login.asp" onSubmit="return check()">
  <div id="center">
    <div id="center_left"></div>
    <div id="center_middle">
      <div class="user">
        <label>�û�����
        <input type="text" name="admin" id="admin" />
        </label>
      </div>
      <div class="user">
        <label>�ܡ��룺
        <input type="password" name="password" id="password" />
        </label>
      </div>
      <div class="chknumber">
        <label>��֤�룺
        <INPUT name=verifycode type=text id="verifycode" style="BORDER-RIGHT: #ffffff 0px solid; BORDER-TOP: #ffffff 0px solid;  FONT-SIZE: 9pt; BORDER-LEFT: #ffffff 0px solid; BORDER-BOTTOM: #ffffff 0px solid; HEIGHT: 16px; width:65px;" title="����д��֤��" size=4 maxLength=20>

<% 
dim rndnum,verifycode 
Randomize 
Do While Len(rndnum)<4 
num1=CStr(Chr((57-48)*rnd+48)) 
rndnum=rndnum&num1 
loop 
session("verifycode")=rndnum 
%>

<font color="#000000" size="2"><%=session("verifycode")%>
<input type="hidden" name="verifycode2" value="<%=session("verifycode")%>">
</label>
      </div>
    </div>
    <div id="center_middle_right"></div>
    <div id="center_submit">
      <div class="button"> <input type="submit" name="Submit" class="submit" value="&nbsp;">
	</div>	  
      <div class="button"><input type="reset" name="Submit" class="reset" value=""> </div>
    </div>
  </div>
</form>
<div id="footer"></div>
</body>
</html>
