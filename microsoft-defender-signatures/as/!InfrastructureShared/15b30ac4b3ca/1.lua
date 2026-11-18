-- Threat: !InfrastructureShared
-- Name: 15b30ac4b3ca
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\activetraderpro", 1, true) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "ExecutedPENoCert")
if not l_0_1 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1571", "command_control_p")
return mp.INFECTED
