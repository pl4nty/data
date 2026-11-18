-- Threat: !InfrastructureShared
-- Name: 117b3f003e947
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not (this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil and this_sigattrlog[6].utf8p1 ~= "" and this_sigattrlog[6].utf8p2 ~= nil and this_sigattrlog[6].utf8p2 ~= "" and this_sigattrlog[7].matched) or this_sigattrlog[7].utf8p2 == nil or this_sigattrlog[7].utf8p2 == "" then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[6].utf8p1
local l_0_1 = this_sigattrlog[6].utf8p2
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[7].utf8p2
if SuspMacPathsToMonitor(l_0_0, true) then
  TrackPidAndTechniqueBM("BM", "T1070.006", "DefenseEvasion_IndicatorRemoval_MacTimeStompToPast")
  return mp.INFECTED
end
local l_0_3 = l_0_2:match("[^/]*$")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, l_0_3, 1, true) then
  bm.trigger_sig("SuspTimeStompedToSelf", l_0_2)
end
return mp.CLEAN
