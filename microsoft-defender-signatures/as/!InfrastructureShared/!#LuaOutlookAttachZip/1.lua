-- Threat: !InfrastructureShared
-- Name: !#Lua:OutlookAttachZip
-- Type: 12
-- MpAttributes: BM_ZIP_FILE & RPF:TopLevelFile & MpOnOpenOrCloseRtpScan

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if l_0_0:find("\\inetcache\\content.outlook\\", 1, true) ~= nil then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1 == "outlook.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
