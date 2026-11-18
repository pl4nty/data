-- Threat: !InfrastructureShared
-- Name: bcb385d2932b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if 70 < #l_0_1 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1562.001", "DefenseEvasion")
return mp.INFECTED
