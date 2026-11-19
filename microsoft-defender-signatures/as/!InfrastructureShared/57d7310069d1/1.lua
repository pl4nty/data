-- Threat: !InfrastructureShared
-- Name: 57d7310069d1
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
