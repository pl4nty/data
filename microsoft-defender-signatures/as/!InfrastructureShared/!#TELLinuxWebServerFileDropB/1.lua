-- Threat: !InfrastructureShared
-- Name: !#TEL:Linux/WebServerFileDrop.B
-- Type: 24
-- Includes: BMLuaLib
-- MpAttributes: SLF:Linux/WebServerFileDrop.A

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_1 = mp.GetParentProcInfo(l_0_0)
if l_0_1 ~= nil then
  local l_0_2 = {
    {"", "apache2"},
    {"", "nginx"},
    {"", "httpd"},
    {"", "php-fpm"}
  }
  if checkParentCmdline(l_0_0, l_0_2, 5) then
    mp.set_mpattribute("BM_WebServerFileDrop")
    return mp.INFECTED
  end
end
return mp.CLEAN
