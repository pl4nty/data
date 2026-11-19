-- Threat: !InfrastructureShared
-- Name: ced7b920730f
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
