-- Threat: !InfrastructureShared
-- Name: !#LUA:UnKnownFileTypeWatchdog
-- Type: 13
-- MpAttributes: BM_UNKNOWN_FILE & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if l_0_0 < 1280 or 1048576 < l_0_0 then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_2 == nil then
  return mp.CLEAN
end
if #l_0_1 < 4 or 512 < #l_0_1 then
  return mp.CLEAN
end
if l_0_1:match("\\.-\\.-\\.-\\.-\\.-\\.-\\") ~= nil then
  return mp.CLEAN
end
local l_0_3 = {
  "boot",
  "program files",
  "recycle",
  "system volume information",
  "temp",
  "tmp",
  "thumbs",
  "tmp",
  "windows",
  "winnt"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if string.find(l_0_1, l_0_5) then
    return mp.CLEAN
  end
end
local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
l_0_6 = (l_0_6 == nil and "" or l_0_6):lower()
local l_0_7 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
l_0_7 = (l_0_7 == nil and "" or l_0_7):lower()
local l_0_8 = l_0_7 .. "\\" .. l_0_6
local l_0_9 = MpCommon.QueryPersistContext(l_0_8, "contextualpersistdropnewexepe")
local l_0_10 = MpCommon.QueryPersistContext(l_0_8, l_0_1)
if l_0_9 and not l_0_10 then
  MpCommon.AppendPersistContext(l_0_8, l_0_1, 120)
  local l_0_11 = MpCommon.GetPersistContext(l_0_8)
  if l_0_11 ~= nil and 4 < #l_0_11 then
    mp.ReportLowfi(l_0_8, 3613929297)
  end
end
return mp.CLEAN
