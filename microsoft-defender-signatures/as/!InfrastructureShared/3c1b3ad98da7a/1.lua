-- Threat: !InfrastructureShared
-- Name: 3c1b3ad98da7a
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1072", "LateralMovement_SoftwareDeploymentTools_PyImpacket")
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_3.ppid)
end
return mp.INFECTED
