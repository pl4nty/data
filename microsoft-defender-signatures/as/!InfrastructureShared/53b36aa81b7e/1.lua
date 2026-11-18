-- Threat: !InfrastructureShared
-- Name: 53b36aa81b7e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = this_sigattrlog[2].utf8p2
if string.find(l_0_0, "activate", 1, true) then
  TrackPidAndTechniqueBM("BM", "T1548.004", "PrivilegeEscalation-CredentialPopupWithinApp")
else
  TrackPidAndTechniqueBM("BM", "T1548.004", "PrivilegeEscalation-CredentialPopup")
end
return mp.INFECTED
