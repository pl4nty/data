-- Threat: !InfrastructureShared
-- Name: 2dd793dc4f86
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
