-- Threat: !InfrastructureShared
-- Name: 55b361a478ec
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
  if string.find(l_0_0, ".key", 1, true) or string.find(l_0_0, ".gpg", 1, true) or string.find(l_0_0, ".pgp", 1, true) or string.find(l_0_0, ".ppk", 1, true) or string.find(l_0_0, ".p12", 1, true) or string.find(l_0_0, ".pem", 1, true) or string.find(l_0_0, ".pfx", 1, true) or string.find(l_0_0, ".cer", 1, true) or string.find(l_0_0, ".p7b", 1, true) or string.find(l_0_0, ".asc", 1, true) or string.find(l_0_0, ".kbdx", 1, true) then
    TrackPidAndTechniqueBM("BM", "T1552.004", "CredentialAccess_PrivateKeys")
    return mp.INFECTED
  end
end
return mp.CLEAN
