-- Threat: !InfrastructureShared
-- Name: 75d796066df1
-- Type: 21
-- Includes: HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
return mp.INFECTED
