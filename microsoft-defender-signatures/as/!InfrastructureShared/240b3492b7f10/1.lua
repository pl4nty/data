-- Threat: !InfrastructureShared
-- Name: 240b3492b7f10
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[9].matched or this_sigattrlog[9].utf8p1 == nil or this_sigattrlog[9].utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[9].utf8p1)
local l_0_1 = string.lower(this_sigattrlog[9].utf8p2)
local l_0_2 = {
  "\\users\\",
  "\\appdata\\",
  "\\temp\\",
  "\\desktop\\",
  "\\downloads\\",
  "\\documents\\",
  "\\public\\"
}
if not contains(l_0_0, l_0_2, true) then
  return mp.CLEAN
end
local l_0_3 = bm.get_imagepath()
if isnull(l_0_3) then
  return mp.CLEAN
end
if l_0_0 ~= string.lower(l_0_3) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
bm.add_related_file(l_0_1)
bm.add_related_string("SelfCopyToSys32", l_0_1, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1574.001", "DefenderCloudsPlaceholderLPE.MK")
return mp.INFECTED
