<%
'Session.TimeOut=60 '超时退出时间/单位为分钟
'option explicit
dim conn,connstr,db,rs,rs_s,rs_s1
db="/feedback/lyb.mdb"

Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
conn.Open connstr
Function GetColumnValue (sSql)
	On Error Resume Next		'防止SQL语句有为题，或发生意外错误
	Dim oRs							'定义变量：oRs（数据库操作对象）
	Set oRs=server.CreateObject ("ADODB.Recordset")
	oRs.Open sSql,Conn,1,1
	If oRs.RecordCount>0 And Not Err Then			'判断是否读取到数据并且没发生意外，条件为真则函数返回读取到的第1列的值
		GetColumnValue=oRs.Fields(0).Value
	else
   Response.End()
	End If
	oRs.Close
	Set oRs=Nothing
End Function
function strleach(str)'过滤非法字符函数 
dim tempstr 
if str="" then exit function 
tempstr=replace(str,chr(34),"")' " 
tempstr=replace(tempstr,chr(39),"")' ' 
tempstr=replace(tempstr,chr(60),"")' < 
tempstr=replace(tempstr,chr(62),"")' > 
tempstr=replace(tempstr,chr(37),"")' % 
tempstr=replace(tempstr,chr(38),"")' & 
tempstr=replace(tempstr,chr(40),"")' ( 
tempstr=replace(tempstr,chr(41),"")' ) 
tempstr=replace(tempstr,chr(59),"")' ; 
tempstr=replace(tempstr,chr(43),"")' + 
tempstr=replace(tempstr,chr(45),"")' - 
tempstr=replace(tempstr,chr(91),"")' [ 
tempstr=replace(tempstr,chr(93),"")' ] 
tempstr=replace(tempstr,chr(123),"")' { 
tempstr=replace(tempstr,chr(125),"")' } 
tempstr=replace(tempstr,chr(36),"")' $ 
tempstr=replace(tempstr,chr(94),"")' ^ 
tempstr=replace(tempstr,chr(63),"")' ?
strleach=tempstr 
end function
%>