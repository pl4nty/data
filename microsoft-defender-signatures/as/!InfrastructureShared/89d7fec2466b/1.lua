-- Threat: !InfrastructureShared
-- Name: 89d7fec2466b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1562.004", "DefenseEvasion_ImpairDefenses_DisableSystemFirewall_iptablesflush")
end
return mp.INFECTED
