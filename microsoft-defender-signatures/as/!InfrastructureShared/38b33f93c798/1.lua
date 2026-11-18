-- Threat: !InfrastructureShared
-- Name: 38b33f93c798
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil and string.match(l_0_0, "/%.[^/]+$") then
  TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
