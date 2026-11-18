-- Threat: !InfrastructureShared
-- Name: 55b34907626e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "\\program files", 1, true) or string.find(l_0_1, "\\netlogon\\", 1, true) or string.find(l_0_1, "\\sysvol\\", 1, true) or string.find(l_0_1, "/nologo ", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1095", "command_control_i")
return mp.INFECTED
