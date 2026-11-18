-- Threat: !InfrastructureShared
-- Name: 57d7b7bb9273
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= "" then
  TrackPidAndTechnique(l_0_0.ppid, "T1048.003", "ExfiltrationOverAlternativeProtocol_ExfiltrationOverUnencryptedNonC2Protocol_nping")
end
return mp.INFECTED
