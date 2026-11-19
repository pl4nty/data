-- Threat: !InfrastructureShared
-- Name: 8a9b3fcecbd0f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = 150000000
if l_0_0 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1486", "Impact_Encryption")
reportRelatedBmHits()
addRelatedProcess()
return mp.INFECTED
