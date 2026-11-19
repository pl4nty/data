-- Threat: !InfrastructureShared
-- Name: 47d70a468884
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
