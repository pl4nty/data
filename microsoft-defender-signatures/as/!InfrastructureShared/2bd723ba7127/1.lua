-- Threat: !InfrastructureShared
-- Name: 2bd723ba7127
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
