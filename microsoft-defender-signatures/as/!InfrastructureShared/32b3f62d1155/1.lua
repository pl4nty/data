-- Threat: !InfrastructureShared
-- Name: 32b3f62d1155
-- Type: 21
-- Includes: TechniqueTracker, ResearchData

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p2
if type(l_0_0) == "string" and l_0_0 ~= "" then
  set_research_data("SshBruteForceIncoming", l_0_0, true)
end
TrackPidAndTechniqueBM("BM", "T1110", "CredentialAccess_SshBruteForceIn")
return mp.INFECTED
