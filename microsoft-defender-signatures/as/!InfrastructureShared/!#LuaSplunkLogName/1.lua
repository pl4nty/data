-- Threat: !InfrastructureShared
-- Name: !#Lua:SplunkLogName
-- Type: 24
-- MpAttributes: Lua:LOGExt

local l_0_0 = mp.getfilesize()
if l_0_0 < 204800 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename()
if l_0_1 ~= nil and string.find(l_0_1, "Splunk9", 1, true) ~= nil and string.find(l_0_1, "Install_2025", 1, true) ~= nil then
  mp.set_mpattribute("Lua:SplunkInstallLog")
  return mp.INFECTED
end
return mp.CLEAN
