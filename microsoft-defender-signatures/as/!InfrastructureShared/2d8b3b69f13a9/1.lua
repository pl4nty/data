-- Threat: !InfrastructureShared
-- Name: 2d8b3b69f13a9
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

add_parents()
TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_pplbypass")
local l_0_0, l_0_1 = pcall(reportBmInfo)
if not l_0_0 and l_0_1 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED
