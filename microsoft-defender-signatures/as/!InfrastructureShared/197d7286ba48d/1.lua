-- Threat: !InfrastructureShared
-- Name: 197d7286ba48d
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
  local l_0_2 = mp.GetScannedPPID()
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = MpCommon.GetImagePathFromPid(l_0_2)
  if l_0_3 ~= nil then
    if string.find(string.lower(l_0_3), "esentutl.exe", 1, true) then
      local l_0_4 = string.lower(mp.GetProcessCommandLine(l_0_2))
      if isnull(l_0_4) then
        return mp.CLEAN
      end
      if not string.find(l_0_4, "/y ", 1, true) and not string.find(l_0_4, "/vss ", 1, true) then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
