-- Threat: !InfrastructureShared
-- Name: !#Lua:ArchiveTracking.A
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper, GetEmailPaths
-- MpAttributes: RPF:TopLevelFile & MpOnOpenRtpScan & BM_ARCHIVE_FILE_GROUP & LUA:FileSizeLT10M.A & Lua:HasMotw

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_1 = {
  "winrar.exe",
  "7zg.exe",
  "7za.exe",
  "7z.exe",
  "winzip64.exe",
  "winzip32.exe"
}
if not contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_3 == nil then
  return mp.CLEAN
end
if not IsKeyValuePairInRollingQueue("CC_filelist", l_0_3, l_0_2) then
  local l_0_4, l_0_5 = pcall(mp.GetMOTWHostUrl)
  local l_0_6, l_0_7 = pcall(mp.GetMOTWReferrerUrl)
  if IsCommonFileSharingURL(l_0_5) or IsWebmailDownloadURL(l_0_5) or IsWebmailDownloadURL(l_0_7) then
    return mp.CLEAN
  end
  local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH) or ""
  l_0_8 = MpCommon.PathToWin32Path(l_0_8)
  l_0_8 = l_0_8:lower()
  local l_0_9 = l_0_8 .. "\\" .. l_0_0
  local l_0_10 = MpCommon.GetCurrentTimeT()
  local l_0_11 = 31536000
  local l_0_12 = mp.getfilesize()
  local l_0_13 = {
    type = "WARCH",
    ProcessImagePath = l_0_9,
    ProcessPID = l_0_3,
    timestamp = l_0_10,
    FileName = l_0_2,
    FileSize = l_0_12,
    motwhosturl = l_0_5 or "",
    parent = "",
    motwreferrerurl = "",
    score = 1
  }
  AppendToRollingQueue("CC_filelist", l_0_2, safeJsonSerialize(l_0_13), l_0_11, 32)
end
local l_0_14 = "ArchivesWithMotW"
if not IsKeyValuePairInRollingQueue(l_0_14, l_0_3, l_0_2) then
  local l_0_15 = 600
  local l_0_16 = 32
  AppendToRollingQueue(l_0_14, l_0_3, l_0_2, l_0_15, l_0_16, 0)
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
end
return mp.CLEAN
