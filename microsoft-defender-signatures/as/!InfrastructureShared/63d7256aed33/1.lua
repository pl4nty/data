-- Threat: !InfrastructureShared
-- Name: 63d7256aed33
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
local l_0_1 = mp.GetScannedPPID()
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
if not (string.match(l_0_2, "%Wpassword[%W$]") or string.match(l_0_2, "%Wpass[%W$]") or string.match(l_0_2, "%Wpw[%W$]") or string.match(l_0_2, "%Wkey[%W$]")) or l_0_0 == nil then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0.ppid, "T1552.001", "CredentialAccess_GitCredentials")
return mp.LOWFI
