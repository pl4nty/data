-- Threat: !InfrastructureShared
-- Name: 4ebb30b0329c1
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = {
  {
    "cmd.exe",
    "WindowsDefenderATPOnboardingScript.cmd"
  },
  {"", "Onboarding"},
  {
    "powershell.exe",
    "Microsoft\\Windows Defender Advanced Threat Protection\\"
  }
}
if checkParentCmdline(l_0_0.ppid, l_0_1, 2) == true then
  return mp.CLEAN
end
local l_0_2, l_0_3
if this_sigattrlog[12].matched then
  l_0_2 = this_sigattrlog[12].utf8p1
  l_0_3 = this_sigattrlog[12].utf8p2 == "THREAT" and 10 or 5
end
if this_sigattrlog[13].matched then
  l_0_2 = this_sigattrlog[13].utf8p1
  l_0_3 = this_sigattrlog[13].utf8p2 == "THREAT" and 10 or 5
end
if this_sigattrlog[14].matched then
  l_0_2 = this_sigattrlog[14].utf8p1
  l_0_3 = this_sigattrlog[14].utf8p2 == "THREAT" and 10 or 5
end
if this_sigattrlog[15].matched then
  l_0_2 = this_sigattrlog[15].utf8p2
  l_0_2 = l_0_2:match("name=(.*);.*")
  l_0_3 = 5
end
if this_sigattrlog[16].matched then
  l_0_2 = this_sigattrlog[16].utf8p2
  l_0_2 = l_0_2:match("name=(.*);.*")
  l_0_3 = 5
end
if this_sigattrlog[17].matched then
  l_0_2 = this_sigattrlog[17].utf8p2
  l_0_2 = l_0_2:match("name=(.*);.*")
  l_0_3 = 5
end
if this_sigattrlog[18].matched then
  l_0_2 = this_sigattrlog[18].utf8p2
  l_0_2 = l_0_2:match("name=(.*);.*")
  l_0_3 = 10
end
if this_sigattrlog[19].matched then
  l_0_2 = this_sigattrlog[19].utf8p1
  l_0_3 = this_sigattrlog[19].utf8p2 == "INFECTED" and 10 or 5
end
local l_0_4 = false
l_0_4, _ = MpCommon.StringRegExpSearch("(Block|RTP|GpDisable|Srv)", l_0_2)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = 7200
local l_0_6 = 100
local l_0_7 = bm.get_imagepath()
local l_0_8 = l_0_7:match("([^\\]+)$")
local l_0_9, l_0_10 = hasSeenBefore(l_0_8, l_0_2, 7, "TamperingAttemptInMachine")
if not l_0_9 or l_0_10 < 3 then
  AppendToRollingQueue("TamperingAlerts", l_0_8 .. "_" .. l_0_2, l_0_3, l_0_5, l_0_6)
end
local l_0_11 = MpCommon.EnumThreatHistory("HackTool", 600, crypto.bitor(MpCommon.THREAT_HISTORY_CATEGORY_ASR, MpCommon.THREAT_HISTORY_CATEGORY_NP))
if 0 < #l_0_11 or 0 < GetRollingQueueCount("ThreatsOnMachine_Lua") or 15 <= GetRollingQueueSumOfValues("TamperingAlerts") then
  local l_0_12 = GetRollingQueue("TamperingAlerts")
  local l_0_13 = GetRollingQueue("ThreatsOnMachine_Lua")
  bm.add_related_string("HackToolsSeenOnDevice_Lua", safeJsonSerialize(l_0_13), bm.RelatedStringBMReport)
  bm.add_related_string("HackToolsSeenOnDevice", safeJsonSerialize(l_0_11), bm.RelatedStringBMReport)
  bm.add_related_string("TamperingAlertsOnDevice", safeJsonSerialize(l_0_12), bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
