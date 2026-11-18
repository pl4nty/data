-- Threat: !InfrastructureShared
-- Name: 2e3b39c8f0f23
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and IsExcludedByImagePath(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = 50000000
if l_0_1 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1068", "exploit-privesc")
return mp.INFECTED
