<!--#include file="conn.asp"-->
<!--#include file="session1.asp"-->
<%
'退出管理，返回留言首页
if request("action")="loginout" then
session.abandon
Response.Redirect ("index.asp")
end if

session("login")="ok"

function lleft(content,lef)
for le=1 to len(content)
if asc(mid(content,le,1))<0 then
lef=lef-2
else
lef=lef-1
end if
if lef<=0 then exit for
next
lleft=left(content,le)
end function
%>
<HTML>
<HEAD>
<TITLE><%=sitename%></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="description" content="<%=sitename%>">
<meta name="keywords" content="<%=sitename%>">
<link rel="stylesheet" href="images/css.css" type="text/css">
</HEAD>
<center>
<script language="JavaScript" type="text/JavaScript">
function CheckAll(form)  {
  for (var i=0;i<form.elements.length;i++)    {
    var e = form.elements[i];
    if (e.name != 'chkall')       e.checked = form.chkall.checked; 
   }
  }
</script>
<%
if session("login")<>"ok" then 
%>  
<%
else
action=request("action")

'管理首页
if action="" then%>
<form name=book action=book_admin.asp?action=del method=post>
<table width="100%" border="0" cellpadding="5" cellspacing="1" class="table">
	<tr>
	<td width=5% height=25 align=center class="bg_tr">选</td>
	<td width=10% align=center class="bg_tr">信息标题　</td> 
	<td width=35% align=center  class="bg_tr">内容（编辑与回复）</td>
	<td width=10% align=center  class="bg_tr">日期</td>
	<td width=11% align=center  class="bg_tr">状态</td>
	</tr>
<%
dim sql
msg_per_page = 10 '每页显示记录数
Set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from Feedback where del=false order by top desc, PostDate desc"

rs.cursorlocation = 3 
rs.pagesize = msg_per_page '每页显示记录数
rs.open sql,conn,1,1 

	if rs.eof and rs.bof then
	response.write "<tr><td colspan=6 align=center height=50>暂时没有留言</td></tr>"
	end if

	if not (rs.eof and rs.bof) then '检测记录集是否为空
		totalrec = RS.RecordCount '总记录条数
		if rs.recordcount mod msg_per_page = 0 then '计算总页数,recordcount:数据的总记录数
		n = rs.recordcount\msg_per_page 'n:总页数
		else 
		n = rs.recordcount\msg_per_page+1 
		end if 

		currentpage = request("page") 'currentpage:当前页
		If currentpage <> "" then
			currentpage = cint(currentpage)
			if currentpage < 1 then 
				currentpage = 1
			end if 
			if err.number <> 0 then 
				err.clear
				currentpage = 1
			end if
		else
			currentpage = 1
		End if 
		if currentpage*msg_per_page > totalrec and not((currentpage-1)*msg_per_page < totalrec)then 
			currentPage=1
		end if
		rs.absolutepage = currentpage 'absolutepage：设置指针指向某页开头
		rowcount = rs.pagesize 'pagesize：设置每一页的数据记录数
		dim i
		dim k

		Do while not rs.eof and rowcount>0
	content=rs("Comments")	
	replay=rs("replay")
	UserName=rs("UserName")

	if rs("top")="0" then
	Response.write "<tr><td align=center class='td_bg'><input type='checkbox' value='"&rs("ID")&"' name=id>"
		else
	Response.write "<tr><td class='td_bg'><font color=red title='固顶信息不能直接删除，请先解除固顶属性再删除'>TOP</font>"
	end if
	Response.write "</td><td class='td_bg'>"&UserName&"</td><td  class='td_bg'><a href='book_admin.asp?action=replay&id="&rs("ID")&"' title='"&server.htmlencode(content)&"'>"
	response.write lleft(server.htmlencode(content),100)
	response.write "</a></td><td  align=center class='td_bg'>"&rs("Postdate")&"</td><td  align=center class='td_bg'>"
	if Isnull(Replay) then
		response.write "<font color=red class='td_bg'>新留言</font>"
	else				
		response.write "已回复"
	end if
		
	rowcount=rowcount-1
	rs.movenext		
	loop
	end if

	rs.close
	conn.close
	set rs=nothing
	set conn=nothing
%>
<tr>
  <td colspan=6 bgcolor="#E2DDF0" class="td_bg"> 　 
    <input type='checkbox' name=chkall onclick='CheckAll(this.form)'>
    全选 
	<input type="submit" name="action" value="删除" onClick="{if(confirm('该操作不可恢复！\n\n确实删除选定的留言？')){this.document.Prodlist.submit();return true;}return false;}"> 	
	</td></tr>
</table>
</form>
<%
call listPages()
end if

if request("action")="del" then
	delid=replace(request("id"),"'","")
	call delfeedback()
end if

if request("action")="replay" then
	id=request("id")
	call detailfeedback()
end if
if request("action")="setup" then
	call setup()
end if
end if
%>
</body>
<%
sub delfeedback()
	if delid="" or isnull(delid) then

	response.write "<script language='javascript'>"
	response.write "alert('操作失败，没有选择合适参数，请单击“确定”返回！');"
	response.write "location.href='book_admin.asp';"
	response.write "</script>"
	response.end

	else
		conn.execute("delete from Feedback where ID in ("&delid&")")
		conn.close
		set conn=nothing

	response.write "<script language='javascript'>"
	response.write "alert('留言删除成功，请单击“确定”返回！');"
	response.write "location.href='book_admin.asp';"
	response.write "</script>"
	response.end

	end if
end sub

sub detailfeedback()
if id="" then
	response.write "<script language='javascript'>"
	response.write "alert('无此留言编号，请单击“确定”返回！');"
	response.write "location.href='book_admin.asp';"
	response.write "</script>"
	response.end
end if

	'修改留言资料
if request("send")="ok" then
	set rs=server.createobject("adodb.recordset")
	sql = " select * from feedback where del=false and ID="&id
	rs.open sql,conn,1,3

		if not (rs.eof and rs.bof) then
		rs("comments")=request.form("comments")
		rs("Replay")=replace(request.form("Replay"),vbCRLF,"<BR>")
		rs("ReplayDate") = Now()
		rs("Online")=request("Online")
		rs("top")=request("top")
		rs.update
		end if

	rs.close

	response.write "<script language='javascript'>"
	response.write "alert('留言已经修改或回复成功，请单击“确定”返回！');"
	response.write "location.href='book_admin.asp';"
	response.write "</script>"
	response.end
end if

	'显示详细资料
	set rs = server.createobject("adodb.recordset")
	sql = "select * from feedback where ID="&id
	rs.open sql,conn,1,1

		if rs.eof and rs.bof then 
		response.write "<script language='javascript'>"
		response.write "alert('无此留言，请单击“确定”返回！');"
		response.write "location.href='book_admin.asp';"
		response.write "</script>"
		response.end
		end if

		if not (rs.eof and rs.bof) then 
			Comments=replace(rs("Comments"),"<BR>",vbCRLF)
			if rs("replay")<>"" then replay=replace(rs("Replay"),"<BR>",vbCRLF) else repley=""  end if
		%>
   <table width="700" align="center" cellpadding="5" cellspacing="1" class="table" >
		 <form name="repl" method="post" action='book_admin.asp?action=replay&id=<%=id%>'>
		 <tr><TD width=20% height=25 align="right" bgcolor="#CECEE1" class="td_bg">留言者IP</TD>
		 <td height="25" bgcolor="#CECEE1" class="td_bg">　<%=rs("IP")%></td>
		 </tr>
		 <tr><TD width=20% height="25" align="right" bgcolor="#CECEE1" class="td_bg">留言日期</TD>
		 <td height="25" bgcolor="#CECEE1" class="td_bg">　<%=rs("PostDate")%></td></tr>		 
		 <tr>
		   <TD width=20% height="25" align="right" bgcolor="#CECEE1" class="td_bg">留言人</TD>
		   <td height="25" bgcolor="#CECEE1" class="td_bg">　<%=rs("UserName")%>&nbsp;</td></tr>
		<tr><TD width=20% height="25" align="right" bgcolor="#CECEE1" class="td_bg">留言人邮箱</TD>
		<td height="25" bgcolor="#CECEE1" class="td_bg">　<%=rs("UserMail")%>&nbsp;</td></tr>
		<tr>
		  <TD width=20% height="25" align="right" bgcolor="#CECEE1" class="td_bg">电话或QQ </TD>
		  <td height="25" bgcolor="#CECEE1" class="td_bg">　<%=rs("dh")%>&nbsp;</td></tr>
		<tr>
		  <TD height="25" align="right" bgcolor="#CECEE1" class="td_bg">公司名称</TD>
		  <td height="25" bgcolor="#CECEE1" class="td_bg"><%=rs("dz")%></td>
		  </tr>
		<tr><TD width=20% height="25" align="right" bgcolor="#CECEE1" class="td_bg">所属行业</TD>
		<td height="25" bgcolor="#CECEE1" class="td_bg">　<%=rs("qq")%>&nbsp;</td></tr>
		 <tr>
		   <TD width=20% align="right" bgcolor="#CECEE1" class="td_bg">留言内容</TD>
		   <td bgcolor="#CECEE1" class="td_bg"><textarea style="overflow:auto" name="comments" cols="60" rows="8"><%=Comments%></textarea></td></tr>
		 <tr><TD width=20% align="right" valign=top bgcolor="#CECEE1" class="td_bg">回复内容</TD>
		 <td bgcolor="#CECEE1" class="td_bg"><textarea style="overflow:auto" name="Replay" cols="60" rows="8"><%=replay%></textarea>&nbsp;</td>
		 </tr>

		<tr><TD width=20% height="25" align="right" bgcolor="#CECEE1" class="td_bg">是否固顶</TD>
		<td height="25" bgcolor="#CECEE1" class="td_bg"><input type="radio" name="top" value="1" <%if rs("top")="1" then%>checked<%end if%>>
			  固顶<input type="radio" name="top" value="0" <%if rs("top")="0" then%>checked<%end if%>>
		  普通 </td></tr>


		<tr><TD width=20% height="25" align="right" bgcolor="#CECEE1" class="td_bg">是否隐藏</TD>
		<td height="25" bgcolor="#CECEE1" class="td_bg"><input type="radio" name="Online" value="0" <%if rs("Online")="0" then%>checked<%end if%>>
			  隐藏<input type="radio" name="Online" value="1" <%if rs("Online")="1" then%>checked<%end if%>>
		  公开 </td></tr>
			<TR><TD width=20% height="25" align="right" bgcolor="#CECEE1" class="td_bg">&nbsp;
			  <INPUT TYPE="hidden" name=send value=ok></TD><TD height="25" bgcolor="#CECEE1" class="td_bg">
				<input type="submit" name="action" value=" 提 交 "></TD></TR>
</form></TABLE>
		<%
		end if
	rs.close
	set rs=nothing
end sub
'分页
sub listPages() 
if n <= 1 then exit sub 
%>
共<%=totalrec%>条留言 
<%if currentpage = 1 then%>
<font color=darkgray>首页 前页</font>
<%else%> 
<a href="<%=request.ServerVariables("script_name")%>?page=1">
首页</font></a> <a href="<%=request.ServerVariables("script_name")%>?page=<%=currentpage-1%>">前页</a>
<%end if%>
<%if currentpage = n then%> 
<font color=darkgray >下页 末页</font>
<%else%> 
<a href="<%=request.ServerVariables("script_name")%>?page=<%=currentpage+1%>">下页</a> <a href="<%=request.ServerVariables("script_name")%>?page=<%=n%>">末页</a>
<%end if%>
  第<%=currentpage%>页 共<%=n%>页
<%end sub%>