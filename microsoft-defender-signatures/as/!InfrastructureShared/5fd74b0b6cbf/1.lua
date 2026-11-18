-- Threat: !InfrastructureShared
-- Name: 5fd74b0b6cbf
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
