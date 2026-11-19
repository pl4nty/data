-- Threat: !InfrastructureShared
-- Name: 16bb37201fd21
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_string("file_metadata", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1556.003", "CredentialAccess_ModifyAuthenticationProcess_PluggableAuthModules_pam.d")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
