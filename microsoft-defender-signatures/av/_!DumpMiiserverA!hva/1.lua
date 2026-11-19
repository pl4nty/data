-- Threat: \x84!DumpMiiserver.A!hva
-- Type: 13
-- Includes: HvaLookupHelpers
-- MpAttributes: BM_MEMDUMP_FILE

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.match(l_0_0, "^miiserver%s?%(%d+%)?%.dmp$") then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 ~= nil and string.find(string.lower(l_0_1), "taskmgr.exe", 1, true) and IsDeviceHVA() then
    local l_0_2 = ExtractDeviceProperties()
    if l_0_2.DeviceRoles and (l_0_2.DeviceRoles.EntraConnectServer ~= nil or l_0_2.DeviceRoles.EntraCloudSyncServer ~= nil or l_0_2.DeviceRoles.AzureADConnectServer ~= nil) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
