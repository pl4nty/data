-- Threat: !InfrastructureShared
-- Name: 53d7aca3206a
-- Type: 21
-- Includes: HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
return mp.INFECTED
