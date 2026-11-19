-- Threat: !InfrastructureShared
-- Name: 15b36e54cf38
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "ExecutedPENoCert")
if not l_0_1 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1571", "command_control_m")
return mp.INFECTED
