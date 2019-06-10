<!--#include file="conn.asp"-->
<!--#include file="session1.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="images/css.css" type="text/css">
</head>
<body>
<%if request.QueryString("action")="save" then%>
<!--#include file="md5.asp"-->
<%
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from wq_admin where admin='"&request.cookies("admin")&"'",conn,1,3
if md5(trim(request("password")))<>rs("password") then
response.Write "<script language=javascript>alert('原密码错误，请返回重新输入');history.go(-1);</script>"
response.End
else
rs("password")=md5(trim(request("password2")))
rs.Update
rs.Close
set rs=nothing
response.cookies("admin")=""
response.cookies("flag")=""
response.Write "<script language=javascript>alert('更改成功，请用新密码重新登陆！');history.go(-1);</script>"
end if
response.End
end if
%>

<table cellpadding="3" cellspacing="1" border="0" width="100%" class="table" align=center>
  <form name="renpassword" method="post" action="renpassword.asp?action=save">
    <tr> 
      <th height=25 colspan=4 align="center" class="bg_tr">更改管理密码</th>
    </tr>
    <tr> 
      <td width="40%" align="right" class="td_bg">用户名：</td>
      <td width="60%" class="td_bg"><%=request.cookies("admin")%></td>
    </tr>
    <tr> 
      <td align="right" class="td_bg">原密码：</td>
      <td class="td_bg"><input name="password" type="password" id="password" size="20"></td>
    </tr>
    <tr> 
      <td align="right" class="td_bg">新密码：</td>
      <td class="td_bg"><input name="password1" type="password" id="password1" size="20"></td>
    </tr>
    <tr> 
      <td align="right" class="td_bg">确认密码：</td>
      <td class="td_bg"><input  name="password2" type="password" id="password2" size="20"></td>
    </tr>
    <tr> 
      <td colspan="2" align="center" class="td_bg"> 
        <input class="button" onClick="return check();" type="submit" name="Submit" value="确定更改">
      </td>
    </tr>
  </form>
</table>
</body>
</html>
<script LANGUAGE="javascript">
<!--
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function check()
{
  if(checkspace(document.renpassword.password.value)) {
	document.renpassword.password.focus();
    alert("原密码不能为空！");
	return false;
  }
  if(checkspace(document.renpassword.password1.value)) {
	document.renpassword.password1.focus();
    alert("新密码不能为空！");
	return false;
  }
    if(checkspace(document.renpassword.password2.value)) {
	document.renpassword.password2.focus();
    alert("确认密码不能为空！");
	return false;
  }
    if(document.renpassword.password1.value != document.renpassword.password2.value) {
	document.renpassword.password1.focus();
	document.renpassword.password1.value = '';
	document.renpassword.password2.value = '';
    alert("新密码和确认密码不相同，请重新输入");
	return false;
  }
	document.admininfo.submit();
  }
//-->
</script> 
