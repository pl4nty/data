-- Threat: !InfrastructureShared
-- Name: adb3c9a31202
-- Type: 21
-- Includes: TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1195", "InitialAccess_SupplyChainCompromise_ExactMatch")
local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    bm.trigger_sig("BmTraverseTreeBlockMac", "Detected", l_0_3.ppid)
  end
end
return mp.INFECTED
