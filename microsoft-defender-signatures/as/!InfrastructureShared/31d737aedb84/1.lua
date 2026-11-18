-- Threat: !InfrastructureShared
-- Name: 31d737aedb84
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
