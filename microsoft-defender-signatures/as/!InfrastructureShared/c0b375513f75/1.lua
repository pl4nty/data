-- Threat: !InfrastructureShared
-- Name: c0b375513f75
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if IsTechniqueObservedGlobal("T1098", false) then
  l_0_0 = "T1098"
elseif IsTechniqueObservedGlobal("T1078", false) then
  l_0_0 = "T1078"
elseif IsTechniqueObservedGlobal("T1136", false) then
  l_0_0 = "T1136"
elseif IsTechniqueObservedGlobal("CredentialAccess_SshBruteForceIncoming", true) then
  l_0_0 = "CredentialAccess_SshBruteForceInLateral"
  mp.set_mpattribute("Lua:CredentialAccess_SshBruteForceInLateral")
end
if l_0_0 then
  bm.add_related_string("mitre_technique", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
else
  TrackPidAndTechniqueBM("BM", "T1021.004", "LateralMovement")
end
return mp.CLEAN
