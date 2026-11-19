-- Threat: !InfrastructureShared
-- Name: 61d7f13c9ca5
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
