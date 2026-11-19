-- Threat: !InfrastructureShared
-- Name: 60fb3684410ed
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = {}
if this_sigattrlog[23].matched then
  l_0_0.type = "BM_TP_IGNORE"
  l_0_0.block_usermode = this_sigattrlog[23].reg_block_usermode
  l_0_0.event = this_sigattrlog[23].utf8p1
elseif this_sigattrlog[24].matched then
  l_0_0.type = "BM_TP_IGNORE"
  l_0_0.block_usermode = this_sigattrlog[24].reg_block_usermode
  l_0_0.event = this_sigattrlog[24].utf8p1
elseif this_sigattrlog[25].matched then
  l_0_0.type = "BM_TP_BLOCK"
  l_0_0.block_usermode = this_sigattrlog[25].reg_block_usermode
  l_0_0.event = this_sigattrlog[25].utf8p1
elseif this_sigattrlog[26].matched then
  l_0_0.type = "BM_TP_BLOCK"
  l_0_0.block_usermode = this_sigattrlog[26].reg_block_usermode
  l_0_0.event = this_sigattrlog[26].utf8p1
end
if not next(l_0_0) then
  return mp.CLEAN
end
bm.add_related_string("EventInfo", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
add_parents()
reportSessionInformationInclusive()
local l_0_1 = {
  {
    "svchost.exe",
    "gpsvc"
  },
  {
    "svchost.exe",
    "netsvcs"
  },
  {
    "CcmExec.exe",
    ""
  },
  {
    "powershell.exe",
    "Windows Defender Advanced Threat Protection"
  },
  {
    "ConfigSecurityPolicy.exe",
    ""
  }
}
local l_0_2 = bm.get_current_process_startup_info()
local l_0_3, l_0_4, l_0_5, l_0_6 = checkParentCmdlineCaseInsensitive(l_0_2.ppid, l_0_1, 4)
if l_0_3 then
  return mp.CLEAN
end
local l_0_7 = reportRelevantUntrustedEntitiesForPid(l_0_2.ppid)
if l_0_7 and next(l_0_7) then
  bm.add_related_string("HasUntrustedEntities", "true", bm.RelatedStringBMReport)
  bm.add_related_string("UntrustedEntities", safeJsonSerialize(l_0_7), bm.RelatedStringBMReport)
end
local l_0_8 = bm.get_current_process_startup_info()
if not l_0_8 or not l_0_8.ppid then
  return mp.CLEAN
end
local l_0_9 = bm.get_imagepath()
local l_0_10 = l_0_9:match("([^\\]+)$")
local l_0_11, l_0_12 = hasSeenBefore(l_0_10, l_0_0.event, 7, "TamperingAttemptInMachine")
if not l_0_11 or l_0_12 < 3 then
  local l_0_13 = 7200
  local l_0_14 = 1000
  local l_0_15 = "TamperingAlerts_TPAggr_G"
  local l_0_16 = l_0_10 .. "_" .. l_0_0.event
  local l_0_17 = l_0_0.type == "BM_TP_BLOCK" and 10 or 5
  AppendToRollingQueue(l_0_15, l_0_16, l_0_17, l_0_13, l_0_14)
  local l_0_18 = GetRollingQueueSumOfValues(l_0_15)
  if 15 <= l_0_18 then
    local l_0_19 = GetRollingQueue(l_0_15)
    bm.add_related_string("Alerts", safeJsonSerialize(l_0_19), bm.RelatedStringBMReport)
    bm.add_related_string("Score", l_0_18, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
