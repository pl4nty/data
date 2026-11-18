-- Threat: !InfrastructureShared
-- Name: 157b31a73dac3
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and l_0_0 ~= "" then
  TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol")
  bm.trigger_sig("RawSocketOpen", l_0_0)
  bm.add_related_file(l_0_0)
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
