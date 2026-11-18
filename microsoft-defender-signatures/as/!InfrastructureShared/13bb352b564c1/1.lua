-- Threat: !InfrastructureShared
-- Name: 13bb352b564c1
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not (this_sigattrlog[1].matched and this_sigattrlog[2].utf8p1) or not this_sigattrlog[3].utf8p1 then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "\\lsass.exe", 1, true) or string.find(l_0_0, "\\services.exe", 1, true) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
bm.add_related_string("LSA_SECRETS_PATH", this_sigattrlog[1].utf8p1, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1003.004", "SAMDumpingLsaSecrets.MK")
return mp.INFECTED
