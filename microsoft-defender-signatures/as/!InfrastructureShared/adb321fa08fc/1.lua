-- Threat: !InfrastructureShared
-- Name: adb321fa08fc
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = GetRollingQueueKeysAsString("TT_ModifiedServices", "|")
if l_0_0 then
  bm.add_related_string("TT_ModifiedServices", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1489", "mass_service_stop")
  return mp.INFECTED
end
return mp.CLEAN
