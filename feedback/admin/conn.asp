<%
'Session.TimeOut=60 '��ʱ�˳�ʱ��/��λΪ����
'option explicit
dim conn,connstr,db,rs,rs_s,rs_s1
db="/feedback/lyb.mdb"

Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
conn.Open connstr
Function GetColumnValue (sSql)
	On Error Resume Next		'��ֹSQL�����Ϊ�⣬�����������
	Dim oRs							'���������oRs�����ݿ��������
	Set oRs=server.CreateObject ("ADODB.Recordset")
	oRs.Open sSql,Conn,1,1
	If oRs.RecordCount>0 And Not Err Then			'�ж��Ƿ��ȡ�����ݲ���û�������⣬����Ϊ���������ض�ȡ���ĵ�1�е�ֵ
		GetColumnValue=oRs.Fields(0).Value
	else
   Response.End()
	End If
	oRs.Close
	Set oRs=Nothing
End Function
function strleach(str)'���˷Ƿ��ַ����� 
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