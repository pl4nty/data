-- Threat: !InfrastructureShared
-- Name: 97d7d9b3a02d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= "" then
  TrackPidAndTechnique(l_0_0.ppid, "T1574.006", "Persistence_HijackExecutionFlow_DynamicLinkerHijacking_ldp")
end
return mp.INFECTED
