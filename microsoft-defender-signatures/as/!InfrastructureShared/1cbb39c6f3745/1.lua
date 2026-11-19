-- Threat: !InfrastructureShared
-- Name: 1cbb39c6f3745
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1071.001", "posh_webaccess")
return mp.INFECTED
