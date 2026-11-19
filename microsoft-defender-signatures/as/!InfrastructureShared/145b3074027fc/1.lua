-- Threat: !InfrastructureShared
-- Name: 145b3074027fc
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.command_line == nil then
  return mp.CLEAN
end
bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_2) do
  local l_0_5 = mp.bitand(l_0_4.reason_ex, bm.RELATIONSHIP_INJECTION)
  if l_0_5 == bm.RELATIONSHIP_INJECTION then
    TrackPidAndTechniqueBM(l_0_4.ppid, "T1055.002", "processinjection_target_remoteinitiated_b")
    bm.add_threat_process(l_0_4.ppid)
  end
end
TrackPidAndTechniqueBM("BM", "T1055.002", "processinjection_source_remoteinitiated_b")
return mp.INFECTED
