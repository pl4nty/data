-- Threat: !InfrastructureShared
-- Name: 49d7752c5e65
-- Type: 21
-- Includes: HvaLookupHelpers, BMLuaLib

local l_0_0 = false
if IsDeviceHVA() then
  local l_0_1 = ExtractDeviceProperties()
  if l_0_1.DeviceRoles and (l_0_1.DeviceRoles.EntraConnectServer ~= nil or l_0_1.DeviceRoles.AzureADConnectServer ~= nil) then
    l_0_0 = true
  end
end
if not l_0_0 and IsADConnectRole() then
  l_0_0 = true
end
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
