-- Threat: !InfrastructureShared
-- Name: dfb3138b776c
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0:find("\\temp\\%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x_.+%.zip%.") == nil then
  return mp.CLEAN
end
local l_0_1 = mp.IsKnownFriendlyFile(l_0_0, false, false)
if l_0_1 == true then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
local l_0_2 = string.format("loadedModule=%s", l_0_0)
bm.add_related_string("ReferencePath", l_0_2, bm.RelatedStringBMReport)
return mp.INFECTED
