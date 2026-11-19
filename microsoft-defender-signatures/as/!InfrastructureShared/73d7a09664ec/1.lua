-- Threat: !InfrastructureShared
-- Name: 73d7a09664ec
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1562.004", "DefenseEvasion_ImpairDefenses_DisableSystemFirewall_iptables")
end
return mp.INFECTED
