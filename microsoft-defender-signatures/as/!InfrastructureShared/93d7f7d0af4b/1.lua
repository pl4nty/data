-- Threat: !InfrastructureShared
-- Name: 93d7f7d0af4b
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
