-- Threat: !InfrastructureShared
-- Name: 51d741b4bec3
-- Type: 21
-- Includes: BMLuaLib, HvaLookupHelpers

local l_0_0 = false
if IsDeviceHVA() then
  local l_0_1 = ExtractDeviceProperties()
  if l_0_1.DeviceRoles and l_0_1.DeviceRoles.DomainController ~= nil then
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
