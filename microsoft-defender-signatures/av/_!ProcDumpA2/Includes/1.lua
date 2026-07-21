-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!ProcDumpA2\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.GetCurrentTimeT)()
local l_0_1 = GetCurrentPPID()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = "memPagesMetadata_" .. l_0_1
local l_0_3 = GetRollingQueueKeyValue(l_0_2, "PPID")
if not l_0_3 then
  return mp.CLEAN
end
if l_0_3 ~= l_0_1 then
  return mp.CLEAN
end
local l_0_4 = GetRollingQueueKeyValue(l_0_2, "sig_matched")
local l_0_5 = 1
local l_0_6 = 0
local l_0_7 = GetRollingQueueKeyValue(l_0_2, "scan_count")
if l_0_7 then
  l_0_5 = l_0_7 + 1
  local l_0_8 = GetRollingQueueKeyValue(l_0_2, "start_time_procdump_a")
  local l_0_9 = l_0_0 - l_0_8
  l_0_6 = l_0_9
  if l_0_5 == 2 and l_0_9 < 10 then
    return mp.CLEAN
  else
    if l_0_5 >= 3 then
      return mp.CLEAN
    end
  end
end
do
  AppendToRollingQueue(l_0_2, "scan_count", l_0_5, 250)
  local l_0_10, l_0_11 = pcall(getScannedRegions, l_0_4, l_0_2, l_0_5, l_0_6)
  local l_0_12 = ""
  if l_0_10 then
    l_0_12 = "success_" .. tostring(l_0_11)
  else
    l_0_12 = "error_" .. tostring(l_0_11)
  end
  AppendToRollingQueue(l_0_2, "error_log", l_0_12, 250)
  local l_0_13 = "memRegionsMetadata_" .. l_0_5
  ;
  (MpCommon.BmTriggerSig)(l_0_1, l_0_13, l_0_12)
  return mp.SUSPICIOUS
end

