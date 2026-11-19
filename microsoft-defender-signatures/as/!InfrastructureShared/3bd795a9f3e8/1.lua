-- Threat: !InfrastructureShared
-- Name: 3bd795a9f3e8
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
