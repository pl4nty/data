-- Threat: !InfrastructureShared
-- Name: 7dd7e41bf44c
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN
