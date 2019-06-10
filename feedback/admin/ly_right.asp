<!--#include file="session1.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Phoenixframework 使用心得交流区</title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
a:link { font-size: 9pt; color: #344b50; text-decoration: none} 
a:visited { font-size: 9pt; color: #344b50; text-decoration: none} 
a:hover { font-size: 9pt; color: #344b50; text-decoration: none} 
a:active { font-size: 9pt; color: #344b50; text-decoration: none} 
-->
</style>
</head>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 服务器有关参数</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">&nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      
      <tr>
        <td width="23%" height="20" align="left" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><span class="STYLE19">软件版本</span></div></td>
        <td width="77%" height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"></div></td>
        </tr>
      <tr>
        <td height="20" align="left" bgcolor="#FFFFFF" class="STYLE19"><div align="center">服务器名：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=Request.ServerVariables("SERVER_NAME")%>  </div></td>
        </tr>
      <tr>
        <td height="20" align="left" bgcolor="#FFFFFF" class="STYLE19"><div align="center">服务器IP：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=Request.ServerVariables("LOCAL_ADDR")%>  </div></td>
        </tr>
      <tr>
        <td height="20" align="left" bgcolor="#FFFFFF" class="STYLE19"><div align="center">服务器端口：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=Request.ServerVariables("SERVER_PORT")%></div></td>
        </tr>
      <tr>
        <td height="20" align="left" bgcolor="#FFFFFF" class="STYLE19"><div align="center">服务器时间：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=now%></div></td>
        </tr>
      <tr>
        <td height="20" align="left" bgcolor="#FFFFFF" class="STYLE19"><div align="center">IIS版本：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=Request.ServerVariables("SERVER_SOFTWARE")%>  </div></td>
        </tr>
      <tr>
        <td height="20" align="left" bgcolor="#FFFFFF" class="STYLE19"><div align="center">服务器IP：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=Request.ServerVariables("LOCAL_ADDR")%> </div></td>
      </tr>
      <tr>
        <td height="20" align="left" bgcolor="#FFFFFF" class="STYLE19"><div align="center">本机IP：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=request.servervariables("remote_addr")%>  </div></td>
        </tr>
      <tr>
        <td height="20" align="left" bgcolor="#FFFFFF" class="STYLE19"><div align="center">返回首页</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><a href="http://www.phoenixframe.org">返回首页</a></div></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
