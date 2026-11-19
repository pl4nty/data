-- Threat: !InfrastructureShared
-- Name: 32b363bb8422
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
local l_0_1 = mp.GetMotwHostUrlForFile(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = mp.CheckUrl(l_0_1)
if l_0_2 == 1 and l_0_3 == 1 then
  return mp.CLEAN
end
bm.add_related_string("bmurl", l_0_1, bm.RelatedStringBMReport)
return mp.INFECTED
