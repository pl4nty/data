-- Threat: !InfrastructureShared
-- Name: 7dd7478afff2
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
