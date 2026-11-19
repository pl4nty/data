-- Threat: !InfrastructureShared
-- Name: dfb3353910b7
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.IsKnownFriendlyFile(l_0_0, false, false)
if l_0_1 == true then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
mp.ReportLowfi(l_0_0, 793074436)
local l_0_2 = string.format("loadedModule=%s", l_0_0)
bm.add_related_string("ReferencePath", l_0_2, bm.RelatedStringBMReport)
return mp.INFECTED
