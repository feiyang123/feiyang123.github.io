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
response.Write "<script language=javascript>alert('ԭ��������뷵����������');history.go(-1);</script>"
response.End
else
rs("password")=md5(trim(request("password2")))
rs.Update
rs.Close
set rs=nothing
response.cookies("admin")=""
response.cookies("flag")=""
response.Write "<script language=javascript>alert('���ĳɹ����������������µ�½��');history.go(-1);</script>"
end if
response.End
end if
%>

<table cellpadding="3" cellspacing="1" border="0" width="100%" class="table" align=center>
  <form name="renpassword" method="post" action="renpassword.asp?action=save">
    <tr> 
      <th height=25 colspan=4 align="center" class="bg_tr">���Ĺ�������</th>
    </tr>
    <tr> 
      <td width="40%" align="right" class="td_bg">�û�����</td>
      <td width="60%" class="td_bg"><%=request.cookies("admin")%></td>
    </tr>
    <tr> 
      <td align="right" class="td_bg">ԭ���룺</td>
      <td class="td_bg"><input name="password" type="password" id="password" size="20"></td>
    </tr>
    <tr> 
      <td align="right" class="td_bg">�����룺</td>
      <td class="td_bg"><input name="password1" type="password" id="password1" size="20"></td>
    </tr>
    <tr> 
      <td align="right" class="td_bg">ȷ�����룺</td>
      <td class="td_bg"><input  name="password2" type="password" id="password2" size="20"></td>
    </tr>
    <tr> 
      <td colspan="2" align="center" class="td_bg"> 
        <input class="button" onClick="return check();" type="submit" name="Submit" value="ȷ������">
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
    alert("ԭ���벻��Ϊ�գ�");
	return false;
  }
  if(checkspace(document.renpassword.password1.value)) {
	document.renpassword.password1.focus();
    alert("�����벻��Ϊ�գ�");
	return false;
  }
    if(checkspace(document.renpassword.password2.value)) {
	document.renpassword.password2.focus();
    alert("ȷ�����벻��Ϊ�գ�");
	return false;
  }
    if(document.renpassword.password1.value != document.renpassword.password2.value) {
	document.renpassword.password1.focus();
	document.renpassword.password1.value = '';
	document.renpassword.password2.value = '';
    alert("�������ȷ�����벻��ͬ������������");
	return false;
  }
	document.admininfo.submit();
  }
//-->
</script> 
