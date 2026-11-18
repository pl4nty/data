-- Threat: !InfrastructureShared
-- Name: 68fb3cb58530a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if this_sigattrlog[30].matched then
  local l_0_1
  if this_sigattrlog[30].utf8p1 == nil then
    return mp.CLEAN
  end
  l_0_1 = this_sigattrlog[30].utf8p1
  if l_0_1 then
    if string.match(l_0_1, "/%.[^/]+$") then
      TrackPidAndTechniqueBM("BM", "T1560.001", "Collection_ArchiveCollectedData_mt2023")
      reportRelatedBmHits()
      if l_0_0 ~= nil and l_0_0.ppid ~= nil then
        bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_0.ppid)
      end
      return mp.INFECTED
    else
      return mp.CLEAN
    end
  end
end
TrackPidAndTechniqueBM("BM", "T1560.001", "Collection_ArchiveCollectedData_mt2023")
reportRelatedBmHits()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_0.ppid)
end
return mp.INFECTED
