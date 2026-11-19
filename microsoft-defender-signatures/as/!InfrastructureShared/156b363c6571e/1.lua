-- Threat: !InfrastructureShared
-- Name: 156b363c6571e
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = true
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
  l_0_1 = false
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
if string.lower(l_0_0):find("tamper", 1, true) then
  return mp.CLEAN
end
local l_0_2 = 7200
local l_0_3 = 100
AppendToRollingQueue("TamperingHackTools", l_0_0, 1, l_0_2, l_0_3)
local l_0_4 = GetRollingQueueKeys("TamperingAlerts")
if l_0_4 ~= nil and type(l_0_4) == "table" then
  local l_0_5 = "["
  for l_0_6, l_0_7 in ipairs(l_0_4) do
    l_0_5 = l_0_5 .. "|" .. l_0_7
  end
  l_0_5 = l_0_5 .. "]"
  if l_0_5 ~= "[]" then
    bm.add_related_string("TamperingAlertsOnMachine", l_0_5, bm.RelatedStringBMReport)
    bm.add_related_string("HackToolsOnMachine", l_0_0, bm.RelatedStringBMReport)
    bm.add_related_string("IsThreatDetection", l_0_1, bm.RelatedStringBMReport)
    add_parents()
    reportRelevantUntrustedEntities(0)
    reportAVExcludedEntities()
    return mp.INFECTED
  end
end
local l_0_8 = GetRollingQueueKeys("TamperingHackTools")
local l_0_9 = "["
local l_0_10 = 0
for l_0_11, l_0_12 in ipairs(l_0_8) do
  l_0_9 = l_0_9 .. "|" .. l_0_12
  l_0_10 = l_0_10 + 1
end
l_0_9 = l_0_9 .. "]"
if 3 <= l_0_10 then
  bm.add_related_string("HackToolsOnMachine", l_0_9, bm.RelatedStringBMReport)
  bm.add_related_string("IsThreatDetection", l_0_1, bm.RelatedStringBMReport)
  add_parents()
  reportRelevantUntrustedEntities(0)
  reportAVExcludedEntities()
  return mp.INFECTED
end
return mp.CLEAN
