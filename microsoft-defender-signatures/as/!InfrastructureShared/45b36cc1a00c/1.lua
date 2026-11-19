-- Threat: !InfrastructureShared
-- Name: 45b36cc1a00c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "\\program files", 1, true) or string.find(l_0_1, "\\netlogon\\", 1, true) or string.find(l_0_1, "\\sysvol\\", 1, true) or string.find(l_0_1, " -nologo ", 1, true) or string.find(l_0_1, " -noprofile ", 1, true) or string.find(l_0_1, " -noninteractive ", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1071", "command_control_d")
return mp.INFECTED
