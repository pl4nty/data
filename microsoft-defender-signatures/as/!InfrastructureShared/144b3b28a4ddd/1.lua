-- Threat: !InfrastructureShared
-- Name: 144b3b28a4ddd
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TrackPidAndTechniqueBM("BM", "T1486", "Impact_Encryption")
reportRelatedBmHits()
addRelatedProcess()
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_3.ppid)
end
return mp.INFECTED
