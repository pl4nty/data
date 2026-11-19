-- Threat: !InfrastructureShared
-- Name: 2fb34935d330
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
local l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
for l_0_2 in string.gmatch(l_0_1, "[^|]+") do
  if not string.find(l_0_2, "fileshares", 1, true) then
    return mp.CLEAN
  end
end
local l_0_3 = sysio.RegOpenKey("HKLM\\SOFTWARE\\POLICIES\\Microsoft\\Windows Defender\\Signature Updates")
if not l_0_3 then
  l_0_3 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Signature Updates")
  if not l_0_3 then
    return mp.INFECTED
  end
end
local l_0_4 = sysio.GetRegValueAsString(l_0_3, "DefinitionUpdateFileSharesSources")
if not l_0_4 then
  return mp.INFECTED
end
for l_0_5 in string.gmatch(l_0_4, "[^|]+") do
  if string.find(l_0_5, "\\\\[^\\]+\\[^\\]+") then
    return mp.CLEAN
  end
end
return mp.INFECTED
