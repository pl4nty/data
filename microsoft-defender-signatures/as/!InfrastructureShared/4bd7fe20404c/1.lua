-- Threat: !InfrastructureShared
-- Name: 4bd7fe20404c
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
