-- Threat: !InfrastructureShared
-- Name: 449b305afe467
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
    "",
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
local l_0_2 = false
_, l_0_2 = pcall(MpCommon.QuerySessionInformation, l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3, l_0_4
if this_sigattrlog[12].matched then
  l_0_3 = this_sigattrlog[12].utf8p1
  l_0_4 = this_sigattrlog[12].utf8p2 == "THREAT" and 10 or 5
end
if this_sigattrlog[13].matched then
  l_0_3 = this_sigattrlog[13].utf8p1
  l_0_4 = this_sigattrlog[13].utf8p2 == "THREAT" and 10 or 5
end
if this_sigattrlog[14].matched then
  l_0_3 = this_sigattrlog[14].utf8p1
  l_0_4 = this_sigattrlog[14].utf8p2 == "THREAT" and 10 or 5
end
if this_sigattrlog[15].matched then
  l_0_3 = this_sigattrlog[15].utf8p2
  l_0_3 = l_0_3:match("name=(.*);.*")
  l_0_4 = 5
end
if this_sigattrlog[16].matched then
  l_0_3 = this_sigattrlog[16].utf8p2
  l_0_3 = l_0_3:match("name=(.*);.*")
  l_0_4 = 5
end
if this_sigattrlog[17].matched then
  l_0_3 = this_sigattrlog[17].utf8p1
  l_0_4 = this_sigattrlog[17].utf8p2 == "INFECTED" and 10 or 5
end
local l_0_5 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSUserName)
local l_0_6 = bm.get_imagepath()
local l_0_7 = l_0_6:match("([^\\]+)$")
local l_0_8 = l_0_7 .. "_" .. tostring(l_0_5)
local l_0_9, l_0_10 = hasSeenBefore(l_0_8, l_0_3, 7, "RemoteTamperingAttemptInMachine")
if not l_0_9 or l_0_10 < 3 then
  local l_0_11 = 7200
  local l_0_12 = 1000
  local l_0_13 = "TamperingAlerts_Remote"
  AppendToRollingQueue(l_0_13, l_0_7 .. "_" .. l_0_3, l_0_4, l_0_11, l_0_12)
  local l_0_14 = GetRollingQueueSumOfValues(l_0_13)
  if 15 <= l_0_14 then
    local l_0_15 = GetRollingQueue(l_0_13)
    bm.add_related_string("Alerts", safeJsonSerialize(l_0_15), bm.RelatedStringBMReport)
    reportSessionInformationInclusive()
    add_parents()
    return mp.INFECTED
  end
end
return mp.CLEAN
