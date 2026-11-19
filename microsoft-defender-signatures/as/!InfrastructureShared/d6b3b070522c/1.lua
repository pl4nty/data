-- Threat: !InfrastructureShared
-- Name: d6b3b070522c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1, l_0_2 = GetAppomalyProcessAttribute(l_0_0.ppid)
if not l_0_1 then
  return mp.CLEAN
end
reportSessionInformation()
add_parents()
reportRelevantUntrustedEntities(0)
local l_0_3
if this_sigattrlog[1].matched then
  l_0_3 = "LolBinsWin"
elseif this_sigattrlog[2].matched then
  l_0_3 = "ExploratoryCommands"
elseif this_sigattrlog[3].matched then
  l_0_3 = "InterestingPSCommands"
elseif this_sigattrlog[4].matched then
  l_0_3 = "InterestingCmdArgs"
end
bm.add_related_string("DetectorID", l_0_3, bm.RelatedStringBMReport)
local l_0_4 = {
  "LolBinsWin",
  "ExploratoryCommands",
  "InterestingPSCommands",
  "InterestingCmdArgs"
}
local l_0_5 = {}
for l_0_6, l_0_7 in ipairs(l_0_4) do
  local l_0_8 = GetRollingQueueKeyValues("PFApp_Pid_" .. l_0_7, l_0_0.ppid)
  l_0_5[l_0_7] = {}
  local l_0_9 = 0
  for l_0_10, l_0_11 in ipairs(l_0_8) do
    if not l_0_5[l_0_11.value] and l_0_9 < 10 then
      l_0_5[l_0_7][l_0_11.value] = true
      l_0_9 = l_0_9 + 1
    end
  end
end
bm.add_related_string("Exploratory_Commands", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
if l_0_0 then
  local l_0_12 = "ExploratoryCmd[" .. l_0_0.ppid:match("pid:(%d+)") .. "]"
  local l_0_13 = {}
  l_0_13.InterestingCommands = l_0_5
  IncreaseProcessAnomalyScore(l_0_0.ppid, 5, l_0_12, l_0_1, l_0_13)
end
return mp.INFECTED
