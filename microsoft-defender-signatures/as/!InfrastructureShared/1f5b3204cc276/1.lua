-- Threat: !InfrastructureShared
-- Name: 1f5b3204cc276
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p1)
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p1)
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[9].utf8p1)
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[10].utf8p1)
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[11].utf8p1)
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[12].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_string("file_metadata", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1556.003", "CredentialAccess_ModifyAuthenticationProcess_PluggableAuthModules_pamunix")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
