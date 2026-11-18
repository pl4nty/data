-- Threat: !InfrastructureShared
-- Name: d6b330b7d595
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

if IsDetectionThresholdMet("BM") then
  local l_0_0 = GetRollingQueueKeysAsString("TT_ModifiedServices", "|")
  if l_0_0 then
    bm.add_related_string("TT_ModifiedServices", l_0_0, bm.RelatedStringBMReport)
    TrackPidAndTechniqueBM("BM", "T1489", "mass_service_stop")
    return mp.INFECTED
  end
end
return mp.CLEAN
