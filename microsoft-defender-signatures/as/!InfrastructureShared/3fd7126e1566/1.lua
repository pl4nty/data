-- Threat: !InfrastructureShared
-- Name: 3fd7126e1566
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
