-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win32/NgrokOnHVA.A!hva
-- Type: 13
-- Includes: HvaLookupHelpers
-- MpAttributes: AGGR:Ngrok & Lua:NewFileContextDataPresent

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
