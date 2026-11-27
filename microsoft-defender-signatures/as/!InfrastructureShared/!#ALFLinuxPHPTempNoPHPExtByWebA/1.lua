-- Threat: !InfrastructureShared
-- Name: !#ALF:Linux/PHPTempNoPHPExtByWeb.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & !Lua:PHPExt & !Lua:INCExt & BM_PHP_FILE & MpOnModifiedCloseRtpScan

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if not l_0_1 or 8192 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("^/tmp/") or l_0_0:match("^/var/tmp/") or l_0_0:match("^/dev/shm/")
if not l_0_2 then
  return mp.CLEAN
end
if l_0_0:find("/tmp/.zendsem.", 1, true) or l_0_0:find("/tmp/requestdir/", 1, true) or l_0_0:find("/tmp/composer", 1, true) or l_0_0:find("/tmp/phpstan/", 1, true) or l_0_0:find("/tmp/upgrade_status/phpstan/cache/", 1, true) or l_0_0:find("/tmp/simplesamlcache/", 1, true) or l_0_0:find("/var/tmp/tuleap_cache/template_engine/", 1, true) or l_0_0:find("/vendor/", 1, true) or l_0_0:find("/tests/", 1, true) then
  return mp.CLEAN
end
local l_0_3 = l_0_0:match("([^/]+)$")
if not l_0_3 then
  return mp.CLEAN
end
if l_0_3:match("^php_config_") or l_0_3:match("^php_db_") or l_0_3:match("^tmpfunc_") or l_0_3:match("%.tmp$") or l_0_3:match("^__mustache_") or l_0_3:match("^get.*service%.php") then
  return mp.CLEAN
end
local l_0_5 = l_0_3:match("^php[%w]+$") and 8 <= #l_0_3 and #l_0_3 <= 32
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_6 then
  return mp.CLEAN
end
l_0_6 = string.lower(l_0_6)
if l_0_6:match("^php[0-9.]*$") or l_0_6:match("^php[-_]?fpm[0-9.]*$") or l_0_6:match("^php[-_]?cgi[0-9.]*$") or l_0_6 == "httpd" or l_0_6 == "apache" or l_0_6 == "apache2" or l_0_6 == "nginx" then
  return mp.INFECTED
end
return mp.CLEAN
