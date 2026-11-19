-- Threat: !InfrastructureShared
-- Name: c7d7d4807c1e
-- Type: 21
-- Includes: BMLuaLib, HvaLookupHelpers

local l_0_0 = false
if IsDeviceHVA() then
  local l_0_1 = ExtractDeviceProperties()
  if l_0_1.DeviceRoles and (l_0_1.DeviceRoles.DomainController ~= nil or l_0_1.DeviceRoles.Dns ~= nil) then
    l_0_0 = true
  end
end
if not l_0_0 and IsActiveDirectoryRole() then
  l_0_0 = true
end
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
