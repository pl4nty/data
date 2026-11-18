-- Threat: !InfrastructureShared
-- Name: 45b3479d805b
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1003.003", "edb_exfil")
return mp.INFECTED
