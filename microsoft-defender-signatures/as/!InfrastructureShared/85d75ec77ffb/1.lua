-- Threat: !InfrastructureShared
-- Name: 85d75ec77ffb
-- Type: 21
-- Includes: HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
return mp.INFECTED
