-- Threat: !InfrastructureShared
-- Name: 49d7f4426fa2
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
