-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAUEFIModuleTracker\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_UEFISTREAM then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = (mp.getfilesize)()
;
(mp.readprotection)(false)
local l_0_2 = (mp.readfile)(0, l_0_1)
;
(mp.readprotection)(true)
local l_0_3 = (crypto.Sha256Buffer)(l_0_2, 0, #l_0_2)
local l_0_4 = GetRollingQueueKeyValue("UEFIFirmwareHashList", l_0_0)
local l_0_5 = GetRollingQueueCount("UEFIFirmwareHashList")
local l_0_6 = GetAtomicCounter("UEFICloudCalls")
if l_0_4 ~= nil and l_0_4 ~= l_0_3 then
  local l_0_7 = {}
  l_0_7.CONTENT_SOURCE = "UEFI_HASH_TRACKER"
  l_0_7.TAG = "NOLOOKUP"
  l_0_7.FilePath = l_0_0
  l_0_7.OldHash = l_0_4
  l_0_7.NewHash = l_0_3
  l_0_7.UEFIFirmwareHashListLength = l_0_5
  l_0_7.CloudCallCounter = l_0_6
  if l_0_6 == nil or l_0_6 < 20 then
    AddToAtomicCounter("UEFICloudCalls", 1, 86400)
    local l_0_8 = SafeGetUrlReputation
    local l_0_9 = {}
    -- DECOMPILER ERROR at PC78: No list found for R9 , SetList fails

    -- DECOMPILER ERROR at PC79: Overwrote pending register: R10 in 'AssignReg'

    l_0_8(l_0_9, "http://4205df77-0bd1-468b-8de8-dad939e44439.report", true, 4000, false)
  end
end
do
  AppendToRollingQueue("UEFIFirmwareHashList", l_0_0, l_0_3, 31104000, 1000)
  local l_0_10 = GetRollingQueueKeyValue("UEFIFirmwareHashListCachedData", "ReportUEFIData")
  if l_0_10 ~= nil then
    local l_0_11 = {}
    l_0_11.CONTENT_SOURCE = "UEFI_STATUS_REPORT"
    l_0_11.TAG = "NOLOOKUP"
    l_0_11.HashList = l_0_10
    l_0_11.UEFIFirmwareHashListLength = l_0_5
    l_0_11.CloudCallCounter = l_0_6
    if l_0_6 == nil or l_0_6 < 20 then
      AppendToRollingQueue("UEFIFirmwareHashListCachedData", "ReportUEFIData", 0, 1, 10)
      AddToAtomicCounter("UEFICloudCalls", 1, 86400)
      local l_0_12 = SafeGetUrlReputation
      local l_0_13 = {}
      -- DECOMPILER ERROR at PC122: No list found for R10 , SetList fails

      -- DECOMPILER ERROR at PC123: Overwrote pending register: R11 in 'AssignReg'

      l_0_12(l_0_13, "http://4205df77-0bd1-468b-8de8-dad939e44439.report", true, 4000, false)
    end
  end
  do
    return mp.CLEAN
  end
end

