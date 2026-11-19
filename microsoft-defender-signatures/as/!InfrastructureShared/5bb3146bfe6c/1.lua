-- Threat: !InfrastructureShared
-- Name: 5bb3146bfe6c
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0.DeviceRoles and (l_0_0.DeviceRoles.DomainController ~= nil or l_0_0.DeviceRoles.Dns ~= nil) then
    return mp.INFECTED
  end
end
return mp.CLEAN
