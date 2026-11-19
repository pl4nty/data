-- Threat: !InfrastructureShared
-- Name: 49d7d783ebfd
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
