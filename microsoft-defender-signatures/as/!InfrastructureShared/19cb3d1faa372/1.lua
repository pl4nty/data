-- Threat: !InfrastructureShared
-- Name: 19cb3d1faa372
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[2].matched or this_sigattrlog[5].matched then
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion")
end
TrackPidAndTechniqueBM("BM", "T1070.003", "DefenseEvasion_IndicatorRemoval_ClearCmdHistory")
mp.set_mpattribute("BM_ClearCmdHistory")
return mp.INFECTED
