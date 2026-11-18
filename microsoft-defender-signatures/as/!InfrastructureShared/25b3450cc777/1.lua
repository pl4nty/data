-- Threat: !InfrastructureShared
-- Name: 25b3450cc777
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if not IsTechniqueObservedForPid(l_0_3.ppid, "susp_spoolhack") then
    TrackPidAndTechniqueBM(l_0_3.ppid, "susp_spoolhack", "spool_childproc", 28800)
  end
end
return mp.INFECTED
