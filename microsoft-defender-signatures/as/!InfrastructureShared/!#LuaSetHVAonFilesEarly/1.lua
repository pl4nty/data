-- Threat: !InfrastructureShared
-- Name: !#Lua:SetHVAonFilesEarly
-- Type: 12
-- Includes: HvaLookupHelpers
-- MpAttributes: RPF:TopLevelFile

if IsDeviceHVA() then
  mp.set_mpattribute("//Lua:IsDeviceHVA")
end
return mp.CLEAN
