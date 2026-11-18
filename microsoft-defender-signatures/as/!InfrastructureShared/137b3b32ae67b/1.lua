-- Threat: !InfrastructureShared
-- Name: 137b3b32ae67b
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1222.001", "WinDir_perm")
return mp.INFECTED
