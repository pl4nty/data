-- Threat: !InfrastructureShared
-- Name: 41d71cda6afe
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
