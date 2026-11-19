-- Threat: !InfrastructureShared
-- Name: 65d7ff722af5
-- Type: 21
-- Includes: HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
return mp.INFECTED
