-- Threat: !InfrastructureShared
-- Name: !#SLF:Backdoor:Win32/SuspAdSyncBin.A!hva
-- Type: 13
-- Includes: HvaLookupHelpers
-- MpAttributes: AGGR:NewUnsignedExe & !AGGR:CleanAdSyncBin

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\microsoft azure ad sync\\bin\\", 1, true) ~= nil and IsDeviceHVA() then
  local l_0_1 = ExtractDeviceProperties()
  if l_0_1.DeviceRoles and (l_0_1.DeviceRoles.EntraConnectServer ~= nil or l_0_1.DeviceRoles.EntraCloudSyncServer ~= nil or l_0_1.DeviceRoles.AzureADConnectServer ~= nil) then
    return mp.INFECTED
  end
end
return mp.CLEAN
