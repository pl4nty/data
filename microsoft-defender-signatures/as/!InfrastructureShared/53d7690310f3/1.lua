-- Threat: !InfrastructureShared
-- Name: 53d7690310f3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= "" then
  TrackPidAndTechnique(l_0_0.ppid, "T1078.004", "Persistence_AccountManipulation_SSHAuthorizedKeys")
end
return mp.INFECTED
