-- Threat: !InfrastructureShared
-- Name: 49d7d7266133
-- Type: 21
-- Includes: HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
return mp.INFECTED
