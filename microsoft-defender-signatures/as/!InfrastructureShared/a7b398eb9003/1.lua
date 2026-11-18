-- Threat: !InfrastructureShared
-- Name: a7b398eb9003
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 and l_0_1 ~= nil then
  local l_0_2 = l_0_1.ppid
  if l_0_2 ~= nil then
    TrackPidAndTechniqueBM(l_0_2, "T1055.002", "processinjection_source_dridex")
    return mp.INFECTED
  end
end
return mp.CLEAN
