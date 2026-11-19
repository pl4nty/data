-- Threat: !InfrastructureShared
-- Name: 43d7637ee0b1
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
