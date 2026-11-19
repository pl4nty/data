-- Threat: !InfrastructureShared
-- Name: 8dd7a9bbd02a
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
