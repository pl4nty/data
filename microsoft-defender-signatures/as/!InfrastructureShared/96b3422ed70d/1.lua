-- Threat: !InfrastructureShared
-- Name: 96b3422ed70d
-- Type: 21
-- Includes: HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
return mp.INFECTED
