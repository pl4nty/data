-- Threat: !InfrastructureShared
-- Name: adb36c55d09d
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_current_process_startup_info()
if not (l_0_0 and l_0_0.ppid) or not GetAppomalyProcessAttribute(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = true
if GetRollingQueueCountForKey("PFApp_Parent_FileDropped", l_0_0.ppid) == 0 then
  l_0_1 = false
end
local l_0_2 = GetRollingQueueKeyValues("PFApp_Parent_FileDropped", l_0_0.ppid)
local l_0_3 = {}
local l_0_4 = 0
for l_0_5, l_0_6 in ipairs(l_0_2) do
  if not l_0_3[l_0_6.value] and l_0_4 < 20 then
    l_0_3[l_0_6.value] = true
    bm.add_related_file(l_0_6.value)
    l_0_4 = l_0_4 + 1
  end
end
bm.add_related_string("Shellcode", safeJsonSerialize(l_0_3), bm.RelatedStringBMReport)
reportSessionInformation()
add_parents()
reportRelevantUntrustedEntities(0)
local l_0_7
if this_sigattrlog[1].matched then
  bm.add_related_string("DetectorID", "LolBinsWin", bm.RelatedStringBMReport)
  l_0_7 = "LolBinsWin"
elseif this_sigattrlog[2].matched then
  bm.add_related_string("DetectorID", "ExploratoryCommands", bm.RelatedStringBMReport)
  l_0_7 = "ExploratoryCommands"
elseif this_sigattrlog[3].matched then
  bm.add_related_string("DetectorID", "InterestingPSCommands", bm.RelatedStringBMReport)
  l_0_7 = "InterestingPSCommands"
elseif this_sigattrlog[4].matched then
  bm.add_related_string("DetectorID", "InterestingCmdArgs", bm.RelatedStringBMReport)
  l_0_7 = "InterestingCmdArgs"
end
local l_0_8 = GetRollingQueueKeyValues("PFApp_Pid_" .. l_0_7, l_0_0.ppid)
local l_0_9 = {}
local l_0_10 = 0
for l_0_11, l_0_12 in ipairs(l_0_8) do
  if not l_0_9[l_0_12.value] and l_0_10 < 20 then
    l_0_9[l_0_12.value] = true
    l_0_10 = l_0_10 + 1
  end
end
if not l_0_1 then
  bm.trigger_sig("ExploratoryCmd_TrackedApps", safeJsonSerialize(l_0_9))
  return mp.CLEAN
end
bm.add_related_string("Exploratory_Commands", safeJsonSerialize(l_0_9), bm.RelatedStringBMReport)
local l_0_13 = "AnomalousFileDropExploratoryCmd[" .. l_0_0.ppid:match("pid:(%d+)") .. "]"
local l_0_14 = {}
l_0_14.DetectorID = l_0_7
l_0_14.InterestingCommands = l_0_9
IncreaseProcessAnomalyScore(l_0_0.ppid, 5, l_0_13, "PFApp_Parent", l_0_14)
return mp.INFECTED
