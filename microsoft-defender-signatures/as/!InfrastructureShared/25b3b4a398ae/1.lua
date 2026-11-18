-- Threat: !InfrastructureShared
-- Name: 25b3b4a398ae
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1110.001", "CredentialAccess_FtpBruteForceOutgoing")
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  TrackPidAndTechniqueBM(l_0_1.ppid, "T1110.001", "CredentialAccess_FtpBruteForceOutgoing")
end
return mp.INFECTED
