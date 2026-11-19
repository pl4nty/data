-- Threat: !InfrastructureShared
-- Name: 82b355bbde2d
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0.DeviceRoles and l_0_0.DeviceRoles.DomainController ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
