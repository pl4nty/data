-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb36c55d09d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid or not GetAppomalyProcessAttribute(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = true
if GetRollingQueueCountForKey("PFApp_Parent_FileDropped", l_0_0.ppid) == 0 then
  l_0_1 = false
end
local l_0_2 = GetRollingQueueKeyValues("PFApp_Parent_FileDropped", l_0_0.ppid)
local l_0_3 = {}
local l_0_4 = 0
for l_0_8,l_0_9 in ipairs(l_0_2) do
  if not l_0_3[l_0_9.value] and l_0_4 < 20 then
    l_0_3[l_0_9.value] = true
    ;
    (bm.add_related_file)(l_0_9.value)
    l_0_4 = l_0_4 + 1
  end
end
;
(bm.add_related_string)("Shellcode", safeJsonSerialize(l_0_3), bm.RelatedStringBMReport)
reportSessionInformation()
add_parents()
reportRelevantUntrustedEntities(0)
local l_0_10 = nil
if (this_sigattrlog[1]).matched then
  (bm.add_related_string)("DetectorID", "LolBinsWin", bm.RelatedStringBMReport)
  l_0_10 = "LolBinsWin"
else
  if (this_sigattrlog[2]).matched then
    (bm.add_related_string)("DetectorID", "ExploratoryCommands", bm.RelatedStringBMReport)
    l_0_10 = "ExploratoryCommands"
  else
    if (this_sigattrlog[3]).matched then
      (bm.add_related_string)("DetectorID", "InterestingPSCommands", bm.RelatedStringBMReport)
      l_0_10 = "InterestingPSCommands"
    else
      if (this_sigattrlog[4]).matched then
        (bm.add_related_string)("DetectorID", "InterestingCmdArgs", bm.RelatedStringBMReport)
        l_0_10 = "InterestingCmdArgs"
      end
    end
  end
end
local l_0_11 = GetRollingQueueKeyValues("PFApp_Pid_" .. l_0_10, l_0_0.ppid)
local l_0_12 = {}
local l_0_13 = 0
for l_0_17,l_0_18 in ipairs(l_0_11) do
  if not l_0_12[l_0_18.value] and l_0_13 < 20 then
    l_0_12[l_0_18.value] = true
    l_0_13 = l_0_13 + 1
  end
end
if not l_0_1 then
  (bm.trigger_sig)("ExploratoryCmd_TrackedApps", safeJsonSerialize(l_0_12))
  return mp.CLEAN
end
;
(bm.add_related_string)("Exploratory_Commands", safeJsonSerialize(l_0_12), bm.RelatedStringBMReport)
local l_0_19 = "AnomalousFileDropExploratoryCmd[" .. (l_0_0.ppid):match("pid:(%d+)") .. "]"
local l_0_20 = {}
l_0_20.DetectorID = l_0_10
l_0_20.InterestingCommands = l_0_12
IncreaseProcessAnomalyScore(l_0_0.ppid, 5, l_0_19, "PFApp_Parent", l_0_20)
return mp.INFECTED

