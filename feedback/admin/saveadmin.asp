<!--#include file="conn.asp"-->
<!--#include file="session1.asp"-->
<!--#include file="md5.asp"-->
<%dim action,admin,adminid
action=request.QueryString("action")
adminid=request.QueryString("id")
admin=trim(request("admin"))
select case action
'//�޸�����
case "edit"
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from wq_admin where adminid="&adminid,conn,1,3
rs("admin")=admin
if trim(request("password"))<>"" then
rs("password")=md5(trim(request("password")))
end if
rs("flag")=int(request("flag"))
rs.Update
rs.Close
set rs=nothing
response.Write "<script>alert('�޸ĳɹ���');window.location='manageadmin.asp'</script>"
'//���������
case "add"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from wq_admin",conn,1,3
rs.addnew
rs("admin")=trim(request("admin2"))
rs("password")=md5(trim(request("password2")))
rs("flag")=int(request("flag2"))
rs.update
rs.close
set rs=nothing
response.Write "<script>alert('��ӳɹ���');window.location='manageadmin.asp'</script>"
'//ɾ������
case "del"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from wq_admin",conn,1,1
if rs.recordcount=1 then
response.Write "<script>alert('���һ������ɾ����');window.location='manageadmin.asp'</script>"
else
conn.execute ("delete from wq_admin where adminid="&request.QueryString("id"))
response.Write "<script>alert('ɾ���ɹ���');window.location='manageadmin.asp'</script>"
end if
end select
%>