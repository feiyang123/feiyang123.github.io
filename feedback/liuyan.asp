<!--#include file="admin/conn.asp" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Phoenixframework ʹ���ĵý�����</title>
<meta name="Keywords" content="Phoenixframework ʹ���ĵý���" />
<meta name="Description" content="Phoenixframework ʹ���ĵý���" />
<link rel="shortcut icon" type="image/x-icon" href="images/desktop.ico" media="screen" />
<link href="images/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <%
if request("send")="ok" then
	username=trim(request.form("username"))
	usermail=trim(request.form("usermail"))
	dh=trim(request.form("dh"))
	dz=trim(request.form("dz"))
	if username="" or request.form("Comments")="" or request.form("dh")="" or request.form("dz")="" then
	response.write "<script language='javascript'>"
	response.write "alert('��д���ϲ�������������������룡');"
	response.write "location.href='javascript:history.go(-1)';"
	response.write "</script>"
	response.end
	end if

	if checktxt(request.form("username"))<>request.form("username") then
	response.write "<script language='javascript'>"
	response.write "alert('��������û����к��зǷ��ַ���������������룡');"
	response.write "location.href='javascript:history.go(-1)';"							
	response.write "</script>"	
	response.end
	end if

	if mailyes=0 then		'����Ϊ����ʱ��������Ƿ�Ϸ�

	if checktxt(request.form("usermail"))<>request.form("usermail") then
	response.write "<script language='javascript'>"
	response.write "alert('������������к��зǷ��ַ���������������룡');"
	response.write "location.href='javascript:history.go(-1)';"							
	response.write "</script>"	
	response.end
	end if

	if Instr(usermail,".")<=0 or Instr(usermail,"@")<=0 or len(usermail)<10 or len(usermail)>50 then
	response.write "<script language='javascript'>"
	response.write "alert('������ĵ����ʼ���ַ��ʽ����ȷ��������������룡');"
	response.write "location.href='javascript:history.go(-1)';"							
	response.write "</script>"	
	response.end
	end if

	end if

	if len(request.form("Comments"))>500 then
	response.write "<script language='javascript'>"
	response.write "alert('��������̫���ˣ��벻Ҫ����"&maxlength&"���ַ���');"
	response.write "location.href='javascript:history.go(-1)';"
	response.write "</script>"
	response.end
	end if
    set rs=server.CreateObject("adodb.recordset")
	sql="select * from Feedback"
	rs.open sql,conn,1,3
			rs.Addnew
			rs("username")=Request("username")
			rs("comments")=Request("comments")
			rs("usermail")=Request("usermail")
			rs("dz")=Request("dz")
			rs("dh")=Request("dh")
			rs("face")=Request("face")
			rs("pic")=Request("pic")
 			rs("qq")=Request("qq")
			view=cstr(view)
			if view<>"0" then view="1"
			rs("online")=view
			rs("IP")=Request.serverVariables("REMOTE_ADDR")
			rs.Update
		rs.close
		set rs=nothing
	response.write "<script language='javascript'>"
 	response.write "alert('�����ύ�ɹ���������ˣ�������ȷ�������������б�');"
 	response.write "location.href='index.asp';"	
	response.write "</script>"
	response.end
end if
%>
    <%
function checktxt(txt)
chrtxt="33|34|35|36|37|38|39|40|41|42|43|44|47|58|59|60|61|62|63|91|92|93|94|96|123|124|125|126|128"
chrtext=split(chrtxt,"|")
for c=0 to ubound(chrtext)
txt=replace(txt,chr(chrtext(c)),"")
next
checktxt=txt
end function
%>
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="109" align="right" valign="top" background="images/bjl2.jpg">&nbsp;</td>
    <td align="center" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="40" align="center"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="48" height="28" background="images/ttl1.jpg">&nbsp;</td>
            <td align="center" background="images/ttm.jpg" class="wfont">Phoenixframework ʹ���ĵý�����</td>
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
                <td>
                 
				 <table width="100%" height="100%" border="0" align="center" cellpadding="8" cellspacing="0">
        <tr>
          <td height="470" align="left" valign="top" bgcolor="#FFFFFF">
<form action="liuyan.asp" method="post" name="book" id="book">
                    <table width="99%" border="0" align="center" cellpadding="5" cellspacing="1" bordercolorlight="#000000" bordercolordark="#ffffff" bgcolor="#cecece">
                      <tr bgcolor="#ebebeb">
                        <td height="30" colspan="2" align="right" bgcolor="#FFFFFF"><a href="index.asp">�������԰�&nbsp;</a></td>
                        </tr>
                      <tr bgcolor="#ebebeb">
                        <td   width="20%" height="30" align="right" bgcolor="#FFFFFF">��ҳ�ǳƣ�</td>
                        <td width="80%" height="30" align="left" bgcolor="#FFFFFF" ><input name="UserName" type="text" class="wenbenkuang" size="30" maxlength="16" />
                            <font color="#FF0000">*</font></td>
                      </tr>
                      <tr bgcolor="#ebebeb">
                        <td   width="20%" height="30" align="right" bgcolor="#FFFFFF">�������䣺</td>
                        <td height="30" align="left" bgcolor="#FFFFFF" ><input name="UserMail" type="text" class="wenbenkuang" size="30"  maxlength="50" />
                            <%if mailyes=0 then%>
                            <font color="#FF0000">*</font>
                            <%end if%>                        </td>
                      </tr>
                      <tr bgcolor="#ebebeb">
                        <td   width="20%" height="30" align="right" bgcolor="#FFFFFF">���ĵ绰��QQ��</td>
                        <td height="30" align="left" bgcolor="#FFFFFF"><input name="dh" type="text" class="wenbenkuang" id="dh" size="30"  maxlength="100" />
                            <font color="#FF0000">*</font></td>
                      </tr>
                      <tr bgcolor="#ebebeb">
                        <td height="30" align="right" bgcolor="#FFFFFF">��˾���ƣ�</td>
                        <td height="30" align="left" bgcolor="#FFFFFF"><input name="dz" type="text" class="wenbenkuang" id="dz" size="60"  maxlength="100" />
                            <font color="#FF0000">*</font></td>
                      </tr>
                      <tr bgcolor="#ebebeb">
                        <td   width="20%" height="30" align="right" bgcolor="#FFFFFF">������ҵ��</td>
                        <td height="30" align="left" bgcolor="#FFFFFF"><input name="QQ" type="text" class="wenbenkuang" value="" size="30"  maxlength="100" />
                          ����IT�����ڵȣ�</td>
                      </tr>
                      <tr bgcolor="#ebebeb">
                        <td   width="20%" height="30" align="right" bgcolor="#FFFFFF">�������ݣ�<br />
                            <font color="red">��500�����ڣ�</font></td>
                        <td height="30" align="left" bgcolor="#FFFFFF"><textarea name="Comments" cols="50" rows="5" class="wenbenkuang1" style="overflow:auto;"></textarea></td>
                      </tr>
                      <tr bgcolor="#ebebeb">
                        <td   width="20%" height="30" align="right" bgcolor="#FFFFFF">��ѡ����飺</td>
                        <td height="30" align="left" bgcolor="#FFFFFF"><input type="radio" value="1" name="face" checked="checked" />
                            <img border="0" src="images/face/face1.gif" title="����"/>
                            <input type="radio" value="2" name="face" />
                            <img border="0" src="images/face/face2.gif" title="·��"/>
                            <input type="radio" value="4" name="face" />
                            <img border="0" src="images/face/face4.gif" title="��һ��"/>
                            <input type="radio" value="5" name="face"/>
                            <img border="0" src="images/face/face5.gif"  title="���"/>
                            <input type="radio" value="6" name="face" />
                            <img border="0" src="images/face/face6.gif" title="����"/>
                            <input type="radio" value="7" name="face" />
                            <img border="0" src="images/face/face7.gif" title="֧��һ��"/></td>
                      </tr>
                      <tr bgcolor="#ebebeb">
                        <td height="30" colspan="2" align="center" bgcolor="#FFFFFF"><input name="Submit22" type="submit" class="go-wenbenkuang" value="�ύ����" />
                            <input name="Submit22" type="reset" class="go-wenbenkuang" value="������д" />
                            <input type="hidden" name="send" value="ok" /></td>
                      </tr>
                    </table>
                </form>

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
