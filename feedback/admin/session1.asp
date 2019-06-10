<%if request.cookies("admin")="" then
response.Write "<script LANGUAGE='javascript'>alert('网络超时或者您还没有登录请登录');window.location.href='login.asp';</script>"
response.End
end if
%>