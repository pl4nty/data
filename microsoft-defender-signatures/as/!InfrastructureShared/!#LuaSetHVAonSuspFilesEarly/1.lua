-- Threat: !InfrastructureShared
-- Name: !#Lua:SetHVAonSuspFilesEarly
-- Type: 12
-- Includes: HvaLookupHelpers, BMLuaLib
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= nil and string.find(l_0_0, "svchost.exe", 1, true) and (IsDeviceHVA() or IsActiveDirectoryRole()) then
  mp.set_mpattribute("Lua:IsDeviceHVA")
end
return mp.CLEAN
