-- Threat: !InfrastructureShared
-- Name: 15b3a6addbb7
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "\\svchost.exe", 1, true) and MpCommon.GetPersistContextCountNoPath("GenericSystemWinlogon") > 0 then
  return mp.INFECTED
end
return mp.CLEAN
