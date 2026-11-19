-- Threat: !InfrastructureShared
-- Name: !#ALF:Linux/PHPTempNoPHPExtByWeb.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & !Lua:PHPExt & !Lua:INCExt & BM_PHP_FILE & MpOnModifiedCloseRtpScan

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if not l_0_1 or 4096 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("^/tmp/") or l_0_0:match("^/var/tmp/") or l_0_0:match("^/dev/shm/")
if not l_0_2 then
  return mp.CLEAN
end
if l_0_0:find("/tmp/.zendsem.", 1, true) or l_0_0:find("/tmp/requestdir/", 1, true) or l_0_0:find("/tmp/composer", 1, true) or l_0_0:find("/tmp/phpstan/", 1, true) or l_0_0:find("/vendor/", 1, true) or l_0_0:find("/tests/", 1, true) then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
if l_0_3:match("^php[0-9.]*$") or l_0_3:match("^php[-_]?fpm[0-9.]*$") or l_0_3:match("^php[-_]?cgi[0-9.]*$") or l_0_3 == "httpd" or l_0_3 == "apache" or l_0_3 == "apache2" or l_0_3 == "nginx" then
  return mp.INFECTED
end
return mp.CLEAN
