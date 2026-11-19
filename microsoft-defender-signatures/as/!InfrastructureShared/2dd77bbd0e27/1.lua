-- Threat: !InfrastructureShared
-- Name: 2dd77bbd0e27
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
