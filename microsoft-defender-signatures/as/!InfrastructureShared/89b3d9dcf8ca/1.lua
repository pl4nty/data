-- Threat: !InfrastructureShared
-- Name: 89b3d9dcf8ca
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1543.001", "EndDefenseEvasion_HideArtifacts_ExactMatch")
return mp.INFECTED
