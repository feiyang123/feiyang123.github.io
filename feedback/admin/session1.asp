<%if request.cookies("admin")="" then
response.Write "<script LANGUAGE='javascript'>alert('���糬ʱ��������û�е�¼���¼');window.location.href='login.asp';</script>"
response.End
end if
%>