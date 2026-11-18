-- Threat: !InfrastructureShared
-- Name: 1a7b35742a1ba
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p1
end
local l_0_1 = "TamperingTracking"
local l_0_2 = reportSessionInformation()
if l_0_2.User and l_0_2.User.UserName then
  local l_0_3 = l_0_1 .. "-" .. l_0_2.User.UserName
  local l_0_4 = GetRollingQueueSumOfValues(l_0_3)
  if l_0_4 and l_0_4.sum > 0 then
    local l_0_5 = GetRollingQueue(l_0_3)
    bm.add_related_string("Tampering_Events_User", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
    bm.add_related_string("DetectionType", l_0_0, bm.RelatedStringBMReport)
    bm.add_related_string("DetectionWeight", tostring(l_0_4.sum), bm.RelatedStringBMReport)
    reportRelevantUntrustedEntities(0)
    return mp.INFECTED
  end
end
local l_0_6 = GetRollingQueueSumOfValues(l_0_1)
if l_0_6 and l_0_6.sum > 0 then
  local l_0_7 = GetRollingQueue(l_0_1)
  bm.add_related_string("Tampering_Events_Machine", safeJsonSerialize(l_0_7), bm.RelatedStringBMReport)
  bm.add_related_string("DetectionType", l_0_0, bm.RelatedStringBMReport)
  bm.add_related_string("DetectionWeight", tostring(l_0_6.sum), bm.RelatedStringBMReport)
  reportRelevantUntrustedEntities(0)
  return mp.INFECTED
end
return mp.CLEAN
