-- Threat: !InfrastructureShared
-- Name: 53d71c38e162
-- Type: 21
-- Includes: HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
return mp.INFECTED
