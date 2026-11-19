-- Threat: !InfrastructureShared
-- Name: 73d7b00d6528
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
