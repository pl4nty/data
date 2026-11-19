-- Threat: !InfrastructureShared
-- Name: 9bd7868d497e
-- Type: 21
-- Includes: HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
return mp.INFECTED
