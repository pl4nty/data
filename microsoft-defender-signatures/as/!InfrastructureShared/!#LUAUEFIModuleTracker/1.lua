-- Threat: !InfrastructureShared
-- Name: !#LUA:UEFIModuleTracker
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpUefiStreamRtpScan & LUA:FileSizeLE10M.B

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_UEFISTREAM then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = mp.getfilesize()
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_1)
mp.readprotection(true)
local l_0_3 = crypto.Sha256Buffer(l_0_2, 0, #l_0_2)
local l_0_4 = GetRollingQueueKeyValue("UEFIFirmwareHashList", l_0_0)
local l_0_5 = GetRollingQueueCount("UEFIFirmwareHashList")
local l_0_6 = GetAtomicCounter("UEFICloudCalls")
if l_0_4 ~= nil and l_0_4 ~= l_0_3 then
  local l_0_7 = {
    CONTENT_SOURCE = "UEFI_HASH_TRACKER",
    TAG = "NOLOOKUP",
    FilePath = l_0_0,
    OldHash = l_0_4,
    NewHash = l_0_3,
    UEFIFirmwareHashListLength = l_0_5,
    CloudCallCounter = l_0_6
  }
  if l_0_6 == nil or l_0_6 < 20 then
    AddToAtomicCounter("UEFICloudCalls", 1, 86400)
    SafeGetUrlReputation({
      "http://4205df77-0bd1-468b-8de8-dad939e44439.report"
    }, l_0_7, true, 4000, false)
  end
end
AppendToRollingQueue("UEFIFirmwareHashList", l_0_0, l_0_3, 31104000, 1000)
local l_0_8 = GetRollingQueueKeyValue("UEFIFirmwareHashListCachedData", "ReportUEFIData")
if l_0_8 ~= nil then
  local l_0_9 = {
    CONTENT_SOURCE = "UEFI_STATUS_REPORT",
    TAG = "NOLOOKUP",
    HashList = l_0_8,
    UEFIFirmwareHashListLength = l_0_5,
    CloudCallCounter = l_0_6
  }
  if l_0_6 == nil or l_0_6 < 20 then
    AppendToRollingQueue("UEFIFirmwareHashListCachedData", "ReportUEFIData", 0, 1, 10)
    AddToAtomicCounter("UEFICloudCalls", 1, 86400)
    SafeGetUrlReputation({
      "http://4205df77-0bd1-468b-8de8-dad939e44439.report"
    }, l_0_9, true, 4000, false)
  end
end
return mp.CLEAN
