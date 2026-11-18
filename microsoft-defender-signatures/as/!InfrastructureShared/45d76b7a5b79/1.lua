-- Threat: !InfrastructureShared
-- Name: 45d76b7a5b79
-- Type: 21
-- Includes: HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
return mp.INFECTED
