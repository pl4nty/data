-- Threat: !InfrastructureShared
-- Name: 65d7a511098f
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
