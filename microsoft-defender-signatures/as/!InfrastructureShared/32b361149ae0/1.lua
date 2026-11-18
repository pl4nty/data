-- Threat: !InfrastructureShared
-- Name: 32b361149ae0
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_imagepath()
TrackPidAndTechniqueBM("BM", "T1110.001", "CredentialAccess_RdpBruteForceOutgoing")
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil and (not string.find(l_0_0, "/usr/sbin/sshd", -14, true) or not string.find(l_0_1.image_path, "/usr/sbin/sshd", -14, true)) then
  TrackPidAndTechniqueBM(l_0_1.ppid, "T1110.001", "CredentialAccess_RdpBruteForceOutgoing")
end
return mp.INFECTED
