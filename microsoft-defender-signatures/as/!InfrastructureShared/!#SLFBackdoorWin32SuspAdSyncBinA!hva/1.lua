-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFBackdoorWin32SuspAdSyncBinA!hva\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
do
  if (string.find)(l_0_0, "\\microsoft azure ad sync\\bin\\", 1, true) ~= nil and IsDeviceHVA() then
    local l_0_1 = ExtractDeviceProperties()
    if l_0_1.DeviceRoles and ((l_0_1.DeviceRoles).EntraConnectServer ~= nil or (l_0_1.DeviceRoles).EntraCloudSyncServer ~= nil or (l_0_1.DeviceRoles).AzureADConnectServer ~= nil) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

