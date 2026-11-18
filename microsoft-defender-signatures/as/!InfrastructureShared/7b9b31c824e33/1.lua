-- Threat: !InfrastructureShared
-- Name: 7b9b31c824e33
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1036.005", "DefenseEvasion_Masquerading_AppWithPopularDoubleExt")
mp.set_mpattribute("DefenseEvasion_Masquerading_AppWithPopularDoubleExt")
return mp.INFECTED
