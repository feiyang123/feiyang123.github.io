var newVer="090119";
if (parseInt(curVer,10)<parseInt(newVer,10)) {
	$("#update").html("你当前的版本为 "+curVer+"，发现新版 "+newVer+"<br /><a href='http://code.google.com/p/jquery-api-zh-cn/downloads/list'>下载新版</a> <a href='http://jquery-api-zh-cn.googlecode.com/svn/trunk/changelog.txt'>更新日志</a>");
}else {
	$("#update").text("当前已是最新版。");
}