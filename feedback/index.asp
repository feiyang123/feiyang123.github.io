<!--#include file="admin/conn.asp" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Phoenixframework ʹ���ĵý�����</title>
<meta name="Keywords" content="Phoenixframework ʹ���ĵý���" />
<meta name="Description" content="Phoenixframework ʹ���ĵý���" />
<link rel="shortcut icon" type="image/x-icon" href="images/desktop.ico" media="screen" />
<link href="images/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	color: #000080;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="109" align="right" valign="top" background="images/bjl2.jpg">&nbsp;</td>
    <td align="center" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="40"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="48" height="28" background="images/ttl1.jpg">&nbsp;</td>
            <td align="center" background="images/ttm.jpg" class="wfont">Phoenixframework ʹ���ĵý���</td>
            <td width="43" height="28" background="images/ttr1.jpg">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="350" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="0">
			<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="18" height="16" align="right" valign="bottom"><img src="images/1.jpg" width="18" height="16" /></td>
                <td height="12" background="images/1r.jpg">&nbsp;</td>
                <td width="17" height="16" align="left" valign="bottom"><img src="images/2.jpg" width="17" height="16" /></td>
              </tr>
              <tr>
                <td width="13" background="images/4s.jpg">&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="7"></td>
                  </tr>
                </table>
<table width="93%" border="0" align="center" cellpadding="0" cellspacing="0" class="grayline">
          <tr>
            <td align="center"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="30" align="center">��Phoenixframework�Զ�������ϵ�����κ�����,��ӭ����������ԡ�<span class="STYLE1"><a href="liuyan.asp">��Ҫ����</a></span></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td align="center"><%
set rs=server.CreateObject("adodb.recordset")
Sql="select * from Feedback where Online=1   order by top desc"
'response.Write(sql)
'response.end
rs.open Sql,conn,1,1
if not (rs.eof and rs.bof) then			'���������ʱ������ʾ���ԡ����е�if�뵹����6�е�end if���Ӧ

if pages=0 or pages="" then pages=4		'ÿҳ��������
rs.pageSize = pages	'ÿҳ��¼��
allPages = rs.pageCount	'��ҳ��
page = Request("page")	'�������ȡ�õ�ǰҳ
'if�ǻ����ĳ�����

If not isNumeric(page) then page=1

if isEmpty(page) or Cint(page) < 1 then
page = 1
elseif Cint(page) >= allPages then
page = allPages 
end if
rs.AbsolutePage = page			'ת��ĳҳͷ��
	Do While Not rs.eof and pages>0
	UserName=rs("UserName")		'�û���
	pic=rs("pic")			'ͷ��
	face=rs("face")			'����
	Comments=rs("Comments")		'����
	bad1=split(bad,"/")		'�����໰
	for t=0 to ubound(bad1)
	Comments=replace(Comments,bad1(t),"***")
	next
	Replay=rs("Replay")		'�ظ�
	Usermail=rs("Usermail")		'�ʼ�
	dh=rs("dh")			'��ҳ
	I=I+1				'���
	temp=RS.RecordCount-(page-1)*rs.pageSize-I+1
	%>
                <table cellspacing="1" cellpadding="3" width="100%" align="center" bgcolor="#cecece" border="0" style="word-break:break-all">
                  <tr>
                    <td valign="top" width="25%" bgcolor="#FFFFFF" rowspan="2" align="center"><table border="0" width="90%">
                        <tr>
                          <td align="center"><img src="images/face/face<%=face%>.gif" border="0" /></td>
                        </tr>
                        <tr>
                          <td align="center">�ǳƣ�<%=left(UserName,4)%><br />
                            ���ԣ�<%=left(rs("ip"),(len(rs("ip"))-4))+"**"%><br /></td>
                        </tr>
                        <tr>
                          <td align="center"><a href="mailto:<%=Usermail%>"> �� ��</a> <a href="<%=URL%>" target='_blank'></a><br /></td>
                        </tr>
                    </table></td>
                    <td width="75%" height="20" align="left" bgcolor="#FFFFFF"><%if rs("top")<>"1" then response.write "[NO."&temp&"]"%>&nbsp;
                         <%=left(UserName,4)%>&nbsp;�����ڣ�<%=cstr(rs("Postdate"))%></td>
                  </tr>
                  <tr>
                    <td width='75%' height="80" align="left" valign="top" bgcolor="#FFFFFF" ><%
	'�Ƿ��������������е�html�ַ�

	if html=0 then
	response.write replace(server.htmlencode(Comments),vbCRLF,"<BR>")
	else
	response.write trim(replace(Comments,vbCRLF,"<BR>"))
	end if
	%>
                        <br />
                        <br />
                        <%if rs("Replay")<>"" then%>
                        <table cellspacing="1" cellpadding="3" width="98%" align="center" bgcolor="#cecece" border="0">
                          <tr>
                            <td valign="top" bgcolor="#F0F0F0"><font color="red">����Ա�ظ� ��</font><br />
                                <%=Replay%> </td>
                          </tr>
                        </table>
                      <br />
                        <%end if%></td>
                  </tr>
                </table>
              <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                  <tr>
                    <td height="8"></td>
                  </tr>
              </table>
              <%
pages = pages - 1
rs.movenext
if rs.eof then exit do
loop

response.write "<table border=0 width=100% align=center><tr><td><form action='' method='post'>�ܼ�����"&RS.RecordCount&"�� "
if page = 1 then
response.write "<font color=darkgray>��ҳ ǰҳ</font>"
else
response.write "<a href=?page=1>��ҳ</a> <a href=?keywords="&keywords&"&page="&page-1&">ǰҳ</a>"
end if
if page = allpages then
response.write "<font color=darkgray> ��ҳ ĩҳ</font>"
else
response.write " <a href=?keywords="&keywords&"&page="&page+1&">��ҳ</a> <a href=?keywords="&keywords&"&page="&allpages&">ĩҳ</a>"
end if
response.write " ��"&page&"ҳ ��"&allpages&"ҳ &nbsp; ת���� "
response.write "<select name='page'>"
for i=1 to allpages
response.write "<option value="&i&">"&i&"</option>"
next
response.write "</select> ҳ <input type=submit name=go value='Go'><input type=hidden name=keywords value='"&keywords&"'></form></td><td align=right>"
response.write "</td></tr></table>"


else
response.write "<table cellSpacing=0 cellPadding=0 width=100% align=center bgColor=#FFFFFF border=0><TR><TD height=120 align=center>"
if keywords="" then response.write "��ʱû������" else response.write "��Ǹ��û���ҵ���Ҫ�鵽������<br><br><a href='javascript:history.go(-1)'>������һҳ</a>" end if
response.write "</TD></TR></TABLE>"
end if
%>
            </td>
          </tr>
      </table>
</td>
<td background="images/2x.jpg">&nbsp;</td>
              </tr>
              <tr>
                <td width="18" height="15" align="right" valign="top"><img src="images/4.jpg" width="18" height="15" /></td>
                <td height="12" background="images/3z.jpg">&nbsp;</td>
                <td width="17" height="15" align="left" valign="top"><img src="images/3.jpg" width="17" height="15" /></td>
              </tr>
            </table>
			  </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="108" align="left" valign="top" background="images/bjr2.jpg">&nbsp;</td>
  </tr>
</table>
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="114" valign="top" background="images/xm.jpg"><table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
       <td height="55" align="center" class="wfont">Copyright@2013-2015 <a href='http://www.phoenixframe.org' target='_blank'>phoenixframe.org</a> All Rights Reserved  
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1000194213'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1000194213%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js?btn=r3.gif" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>
