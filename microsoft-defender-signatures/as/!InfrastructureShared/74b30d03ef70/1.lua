-- Threat: !InfrastructureShared
-- Name: 74b30d03ef70
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.IsKnownFriendlyFile(l_0_0, false, false)
if l_0_1 == true then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.IsKnownFriendlyFile(l_0_2, true, true)
if not l_0_3 then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
mp.ReportLowfi(l_0_0, 2592711727)
local l_0_4 = string.format("loadedModule=%s", l_0_0)
bm.add_related_string("ReferencePath", l_0_4, bm.RelatedStringBMReport)
return mp.INFECTED
