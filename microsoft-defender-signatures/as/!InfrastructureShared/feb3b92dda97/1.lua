-- Threat: !InfrastructureShared
-- Name: feb3b92dda97
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1003", "OSCredentialDumping")
return mp.INFECTED
