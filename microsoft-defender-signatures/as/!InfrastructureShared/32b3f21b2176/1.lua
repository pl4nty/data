-- Threat: !InfrastructureShared
-- Name: 32b3f21b2176
-- Type: 21
-- Includes: TechniqueTracker, ResearchData

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p2
if type(l_0_0) == "string" and l_0_0 ~= "" then
  set_research_data("SshBruteForceIncomingSuccessPublic", l_0_0, true)
end
TrackPidAndTechniqueBM("BM", "T1078", "InitialAccess_SshBruteForceSuccess_PublicSource")
return mp.INFECTED
