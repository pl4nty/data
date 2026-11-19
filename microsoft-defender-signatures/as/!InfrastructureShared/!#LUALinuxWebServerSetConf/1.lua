-- Threat: !InfrastructureShared
-- Name: !#LUA:Linux/WebServerSetConf
-- Type: 12
-- Includes: LuaFuncHelper
-- MpAttributes: BM_TEXT_FILE & (Lua:AbsentExtension | Lua:CONFExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
local l_0_2 = ""
if l_0_1 == "/etc/apache2/sites-available" and l_0_0 == "apache2" then
  l_0_2 = "^%s*DocumentRoot%s+(/.-)/?$"
elseif l_0_1 == "/etc/httpd/conf" and l_0_0 == "httpd" then
  l_0_2 = "^%s*<Directory%s+\"(/.-)/?\">$"
elseif l_0_1 == "/etc/lighttpd" and l_0_0 == "lighttpd" then
  l_0_2 = "^%s*server%.document%-root%s+=%s+\"(/.-)/?\"$"
elseif l_0_1 == "/etc/nginx/sites-available" and l_0_0 == "nginx" then
  l_0_2 = "^%s*root%s+(/.-)/?;$"
else
  return mp.CLEAN
end
local l_0_3 = mp.getfilesize()
local l_0_4 = ""
if l_0_3 <= mp.HEADERPAGE_SZ then
  l_0_4 = tostring(headerpage)
elseif l_0_3 <= mp.HEADERPAGE_SZ + mp.FOOTERPAGE_SZ then
  l_0_4 = tostring(headerpage) .. tostring(footerpage)
else
  mp.readprotection(false)
  l_0_4 = tostring(mp.readfile(0, l_0_3))
  mp.readprotection(true)
end
local l_0_5 = "webserver_conf_root"
local l_0_6 = StringSplit(l_0_4, "\n")
local l_0_7 = false
MpCommon.SetPersistContextNoPath(l_0_5, {}, 0)
for l_0_8, l_0_9 in ipairs(l_0_6) do
  local l_0_10 = string.match(l_0_9, l_0_2)
  if l_0_10 then
    l_0_7 = true
    MpCommon.AppendPersistContextNoPath(l_0_5, l_0_10, 4294967295)
  end
end
if l_0_7 then
  return mp.INFECTED
end
return mp.CLEAN
