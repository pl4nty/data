-- Threat: !InfrastructureShared
-- Name: !#Lua:SetHVAonSuspFiles
-- Type: 13
-- Includes: HvaLookupHelpers, BMLuaLib
-- MpAttributes: RPF:TopLevelFile & (BM_REGHIVE_SAM | BM_REGHIVE_SYSTEM | BM_REGHIVE_SECURITY | Lua:NtdsditEsedbFileHeader.A)

if IsDeviceHVA() or IsActiveDirectoryRole() then
  mp.set_mpattribute("Lua:IsDeviceHVA")
end
return mp.CLEAN
