-- Threat: !InfrastructureShared
-- Name: 5bb3bc082a44
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = MpCommon.AtomicCounterValue("CVE-2026-31431-Burst")
if not l_0_0 or l_0_0 == 0 then
  return mp.CLEAN
end
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1068", "PrivilegeEscalation_CVE-2026-31431")
return mp.INFECTED
