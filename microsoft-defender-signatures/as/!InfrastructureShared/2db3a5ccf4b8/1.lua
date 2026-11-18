-- Threat: !InfrastructureShared
-- Name: 2db3a5ccf4b8
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].ppid
end
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM(l_0_0, "T1562.001", "DefenseEvasion_PtraceScopeToggle")
  local l_0_1, l_0_2 = bm.get_process_relationships(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    bm.add_related_process(l_0_4.ppid)
    TrackPidAndTechniqueBM(l_0_4.ppid, "T1562.001", "DefenseEvasion_PtraceScopeToggle")
  end
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
