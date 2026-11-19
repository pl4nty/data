-- Threat: !InfrastructureShared
-- Name: 31d7b57ccdee
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0 ~= nil and l_0_0.DeviceRoles ~= nil then
    return mp.CLEAN
  end
  if l_0_0.DeviceRoles.InfraITAdminDevice == nil and l_0_0.DeviceRoles.DomainAdminDevice == nil then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
