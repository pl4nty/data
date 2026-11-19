-- Threat: !InfrastructureShared
-- Name: 49d7b848a8cc
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1059", "Execution_CommandandScriptingInterpreter")
end
return mp.INFECTED
