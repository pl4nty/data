-- Threat: !InfrastructureShared
-- Name: 5bb33ede7f89
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = MpCommon.AtomicCounterValue("DirtyFragESP-Burst")
if not l_0_0 or l_0_0 == 0 then
  return mp.CLEAN
end
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1068", "PrivilegeEscalation_DirtyFrag")
return mp.INFECTED
