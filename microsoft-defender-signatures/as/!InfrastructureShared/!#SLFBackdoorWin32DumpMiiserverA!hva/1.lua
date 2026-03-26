-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFBackdoorWin32DumpMiiserverA!hva\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.match)(l_0_0, "^miiserver%s?%(%d+%)?%.dmp$") then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 ~= nil and (string.find)((string.lower)(l_0_1), "taskmgr.exe", 1, true) and IsDeviceHVA() then
    local l_0_2 = ExtractDeviceProperties()
    if l_0_2.DeviceRoles and ((l_0_2.DeviceRoles).EntraConnectServer ~= nil or (l_0_2.DeviceRoles).EntraCloudSyncServer ~= nil or (l_0_2.DeviceRoles).AzureADConnectServer ~= nil) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

