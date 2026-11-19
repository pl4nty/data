-- Threat: !InfrastructureShared
-- Name: 2bd7ceedb17d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1562.004", "DefenseEvasion_ImpairDefenses_DisableSystemFirewall_pf")
end
return mp.INFECTED
