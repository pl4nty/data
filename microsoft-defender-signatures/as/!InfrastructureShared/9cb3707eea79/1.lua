-- Threat: !InfrastructureShared
-- Name: 9cb3707eea79
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 then
  return mp.CLEAN
end
if l_0_0.ppid then
  if IsPidExcluded(l_0_0.ppid) then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1057", "xfer_from_attackerserver_c")
  return mp.INFECTED
end
return mp.CLEAN
