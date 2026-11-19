-- Threat: !InfrastructureShared
-- Name: 100b3c990d4e5
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
TrackPidAndTechniqueBM("BM", "T1048.002", "Exfiltration_ExfilAsymEncNonC2Protocol_ZipScpPull")
return mp.INFECTED
