-- Threat: !InfrastructureShared
-- Name: dab39c8d1cce
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, BasScenarioSpecificInfra

if not IsBasToolProcessForPpid("BM", "AttackIQ") and not IsBasToolProcessFoundInParents("BM", "AttackIQ", 4) then
  return mp.CLEAN
end
local l_0_0 = versioning.GetOrgID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  ["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true,
  ["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true,
  ["c34db763-35fc-4c4a-9ca4-697338808f18"] = true
}
if not l_0_1[string.lower(l_0_0)] then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, "\\lsass.exe", 1, true) or string.find(l_0_2, "\\services.exe", 1, true) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_2, true, false) then
  return mp.CLEAN
end
local l_0_3, l_0_4
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 then
  l_0_3 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 then
  l_0_4 = this_sigattrlog[3].utf8p1
end
if l_0_3 and l_0_4 then
  bm.add_related_string("LSA_SECRETS_PATH", l_0_3, bm.RelatedStringBMReport)
  bm.add_related_string("LSA_SECRETS_PATH2", l_0_4, bm.RelatedStringBMReport)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1003.004", "SAMDumpingLsaSecrets.A")
return mp.INFECTED
