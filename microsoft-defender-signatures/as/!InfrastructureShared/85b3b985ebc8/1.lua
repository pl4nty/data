-- Threat: !InfrastructureShared
-- Name: 85b3b985ebc8
-- Type: 21
-- Includes: HvaLookupHelpers, BMLuaLib

if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0.DeviceRoles and (l_0_0.DeviceRoles.DomainController ~= nil or l_0_0.DeviceRoles.Dns ~= nil) then
    return mp.INFECTED
  end
end
if IsActiveDirectoryRole() then
  return mp.INFECTED
end
return mp.CLEAN
