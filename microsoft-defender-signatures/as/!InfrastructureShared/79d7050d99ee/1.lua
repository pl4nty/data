-- Threat: !InfrastructureShared
-- Name: 79d7050d99ee
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
