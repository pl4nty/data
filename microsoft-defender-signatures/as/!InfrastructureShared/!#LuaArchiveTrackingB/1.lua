-- Threat: !InfrastructureShared
-- Name: !#Lua:ArchiveTracking.B
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & MpOnModifiedCloseRtpScan & MpNewlyCreatedHint & !BM_UNKNOWN_FILE

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_2 == nil or not IsKeyInRollingQueue("ArchivesWithMotW", l_0_2) then
  return mp.CLEAN
end
local l_0_3 = "FilesFromArchiveswithMotw"
local l_0_4 = MpCommon.PathToWin32Path(l_0_0 .. "\\" .. l_0_1)
if IsKeyInRollingQueue(l_0_3, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = GetRollingQueueKeyValues("ArchivesWithMotW", l_0_2)
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6
for l_0_7, l_0_8 in ipairs(l_0_5) do
  local l_0_9 = l_0_8.value:match("([^\\]+)%.")
  if l_0_0:find(l_0_9, 1, true) ~= nil then
    l_0_6 = l_0_8.value
    break
  end
end
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_10 = 600
AppendToRollingQueue(l_0_3, l_0_4, l_0_6, l_0_10, 32)
if IsKeyInRollingQueue("CC_filelist", l_0_6) then
  local l_0_11, l_0_12 = pcall(mp.GetMOTWHostUrl)
  local l_0_13, l_0_14 = pcall(mp.GetMOTWReferrerUrl)
  local l_0_15 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH) or ""
  local l_0_16 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME) or ""
  l_0_15 = MpCommon.PathToWin32Path(l_0_15)
  l_0_15 = l_0_15:lower()
  l_0_16 = l_0_16:lower()
  local l_0_17 = l_0_15 .. "\\" .. l_0_16
  local l_0_18 = MpCommon.GetCurrentTimeT()
  local l_0_19 = 31536000
  local l_0_20 = mp.getfilesize()
  local l_0_21 = {
    type = "EFMRU",
    ProcessImagePath = l_0_17,
    ProcessPID = l_0_2,
    timestamp = l_0_18,
    FileName = l_0_4,
    FileSize = l_0_20,
    motwhosturl = l_0_12 or "",
    parent = l_0_6,
    motwreferrerurl = l_0_14 or "",
    score = 1
  }
  mp.set_mpattribute("BM_FilesFromArchivesWithMotw")
  AppendToRollingQueue("CC_filelist", l_0_4, safeJsonSerialize(l_0_21), l_0_19, 32)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
