-- Threat: !InfrastructureShared
-- Name: 41d717fb8913
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
