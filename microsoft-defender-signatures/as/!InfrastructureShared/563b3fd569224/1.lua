-- Threat: !InfrastructureShared
-- Name: 563b3fd569224
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0
local l_0_1 = false
if this_sigattrlog[12].matched then
  l_0_0 = this_sigattrlog[12].utf8p1
end
if this_sigattrlog[13].matched then
  l_0_0 = this_sigattrlog[13].utf8p1
end
if this_sigattrlog[14].matched then
  l_0_0 = this_sigattrlog[14].utf8p1
end
if this_sigattrlog[15].matched then
  l_0_0 = this_sigattrlog[15].utf8p1
end
if this_sigattrlog[16].matched then
  l_0_0 = this_sigattrlog[16].utf8p1
  l_0_1 = true
end
if this_sigattrlog[17].matched then
  l_0_0 = this_sigattrlog[17].utf8p1
  l_0_1 = true
end
if this_sigattrlog[18].matched then
  l_0_0 = this_sigattrlog[18].utf8p1
  l_0_1 = true
end
if this_sigattrlog[19].matched then
  l_0_0 = this_sigattrlog[19].utf8p1
  l_0_1 = true
end
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if not l_0_2 or not l_0_2.ppid then
  return mp.CLEAN
end
local l_0_3 = bm.get_imagepath()
local l_0_4 = l_0_3:match("([^\\]+)$")
local l_0_5, l_0_6 = hasSeenBefore(l_0_4, l_0_0, 7, "TamperingAttemptInMachine")
if l_0_5 and 3 <= l_0_6 then
  return mp.CLEAN
end
local l_0_7 = 7200
local l_0_8 = 500
if l_0_1 == true then
  AppendToRollingQueue("TamperingAlerts_LimitedSet_A", l_0_4 .. "_" .. l_0_0, l_0_2.ppid, l_0_7, l_0_8)
else
  AppendToRollingQueue("RemotDropped_Malware", l_0_4 .. "_" .. l_0_0, l_0_2.ppid, l_0_7, l_0_8)
end
local l_0_9 = GetRollingQueueCount("TamperingAlerts_LimitedSet_A")
local l_0_10 = GetRollingQueueCount("RemotDropped_Malware")
if l_0_9 + l_0_10 < 2 then
  return mp.CLEAN
end
local l_0_11 = false
local l_0_12 = GetRollingQueue("TamperingAlerts_LimitedSet_A")
local l_0_13 = GetRollingQueue("RemotDropped_Malware")
if 1 < l_0_10 or 1 < l_0_9 then
  l_0_11 = true
elseif l_0_10 == 1 then
  do
    local l_0_14, l_0_15 = next(l_0_13)
    for l_0_16, l_0_17 in pairs(l_0_12) do
      if l_0_15.value == l_0_17.value then
        l_0_11 = true
        break
      end
    end
  end
else
  local l_0_18, l_0_19 = next(l_0_12)
  for l_0_20, l_0_21 in pairs(l_0_13) do
    if l_0_19.value == l_0_21.value then
      l_0_11 = true
      break
    end
  end
end
if l_0_11 then
  bm.add_related_string("TamperingAlertsOnMachine", safeJsonSerialize(l_0_12), bm.RelatedStringBMReport)
  bm.add_related_string("NonTamperingAlertsOnMachine", safeJsonSerialize(l_0_13), bm.RelatedStringBMReport)
  add_parents()
  local l_0_22 = reportRelevantUntrustedEntitiesForPid(l_0_2.ppid)
  bm.add_related_string("UntrustedEntities", safeJsonSerialize(l_0_22), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
