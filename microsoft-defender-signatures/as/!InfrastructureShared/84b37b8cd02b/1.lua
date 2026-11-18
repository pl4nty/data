-- Threat: !InfrastructureShared
-- Name: 84b37b8cd02b
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
TrackPidAndTechniqueBM("BM", "T1071.001", "CommandAndControl_AppLayerProtocol_ZipDownloadOverHttp")
return mp.INFECTED
