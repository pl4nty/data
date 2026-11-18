-- Threat: !InfrastructureShared
-- Name: 102b339c72712
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
