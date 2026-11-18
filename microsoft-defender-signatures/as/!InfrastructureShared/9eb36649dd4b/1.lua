-- Threat: !InfrastructureShared
-- Name: 9eb36649dd4b
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = IsDetectionThresholdMet("BM")
if l_0_0 then
  return mp.INFECTED
end
add_parents()
reportRelatedBmHits()
addOverallNetworkVolume()
reportSessionInformation()
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
return mp.CLEAN
