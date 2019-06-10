<!--#include file="admin/conn.asp" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Phoenixframework 使用心得交流区</title>
<meta name="Keywords" content="Phoenixframework 使用心得交流" />
<meta name="Description" content="Phoenixframework 使用心得交流" />
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
            <td align="center" background="images/ttm.jpg" class="wfont">Phoenixframework 使用心得交流</td>
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
                  <td height="30" align="center">对Phoenixframework自动化工具系列有任何问题,欢迎您在这儿留言→<span class="STYLE1"><a href="liuyan.asp">我要留言</a></span></td>
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
if not (rs.eof and rs.bof) then			'如果有留言时，就显示留言。此行的if与倒数第6行的end if相对应

if pages=0 or pages="" then pages=4		'每页留言条数
rs.pageSize = pages	'每页记录数
allPages = rs.pageCount	'总页数
page = Request("page")	'从浏览器取得当前页
'if是基本的出错处理

If not isNumeric(page) then page=1

if isEmpty(page) or Cint(page) < 1 then
page = 1
elseif Cint(page) >= allPages then
page = allPages 
end if
rs.AbsolutePage = page			'转到某页头部
	Do While Not rs.eof and pages>0
	UserName=rs("UserName")		'用户名
	pic=rs("pic")			'头像
	face=rs("face")			'表情
	Comments=rs("Comments")		'内容
	bad1=split(bad,"/")		'过滤脏话
	for t=0 to ubound(bad1)
	Comments=replace(Comments,bad1(t),"***")
	next
	Replay=rs("Replay")		'回复
	Usermail=rs("Usermail")		'邮件
	dh=rs("dh")			'主页
	I=I+1				'序号
	temp=RS.RecordCount-(page-1)*rs.pageSize-I+1
	%>
                <table cellspacing="1" cellpadding="3" width="100%" align="center" bgcolor="#cecece" border="0" style="word-break:break-all">
                  <tr>
                    <td valign="top" width="25%" bgcolor="#FFFFFF" rowspan="2" align="center"><table border="0" width="90%">
                        <tr>
                          <td align="center"><img src="images/face/face<%=face%>.gif" border="0" /></td>
                        </tr>
                        <tr>
                          <td align="center">昵称：<%=left(UserName,4)%><br />
                            来自：<%=left(rs("ip"),(len(rs("ip"))-4))+"**"%><br /></td>
                        </tr>
                        <tr>
                          <td align="center"><a href="mailto:<%=Usermail%>"> 邮 件</a> <a href="<%=URL%>" target='_blank'></a><br /></td>
                        </tr>
                    </table></td>
                    <td width="75%" height="20" align="left" bgcolor="#FFFFFF"><%if rs("top")<>"1" then response.write "[NO."&temp&"]"%>&nbsp;
                         <%=left(UserName,4)%>&nbsp;发表于：<%=cstr(rs("Postdate"))%></td>
                  </tr>
                  <tr>
                    <td width='75%' height="80" align="left" valign="top" bgcolor="#FFFFFF" ><%
	'是否屏蔽留言内容中的html字符

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
                            <td valign="top" bgcolor="#F0F0F0"><font color="red">管理员回复 ：</font><br />
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

response.write "<table border=0 width=100% align=center><tr><td><form action='' method='post'>总计留言"&RS.RecordCount&"条 "
if page = 1 then
response.write "<font color=darkgray>首页 前页</font>"
else
response.write "<a href=?page=1>首页</a> <a href=?keywords="&keywords&"&page="&page-1&">前页</a>"
end if
if page = allpages then
response.write "<font color=darkgray> 下页 末页</font>"
else
response.write " <a href=?keywords="&keywords&"&page="&page+1&">下页</a> <a href=?keywords="&keywords&"&page="&allpages&">末页</a>"
end if
response.write " 第"&page&"页 共"&allpages&"页 &nbsp; 转到第 "
response.write "<select name='page'>"
for i=1 to allpages
response.write "<option value="&i&">"&i&"</option>"
next
response.write "</select> 页 <input type=submit name=go value='Go'><input type=hidden name=keywords value='"&keywords&"'></form></td><td align=right>"
response.write "</td></tr></table>"


else
response.write "<table cellSpacing=0 cellPadding=0 width=100% align=center bgColor=#FFFFFF border=0><TR><TD height=120 align=center>"
if keywords="" then response.write "暂时没有留言" else response.write "抱歉，没有找到您要查到的内容<br><br><a href='javascript:history.go(-1)'>返回上一页</a>" end if
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
