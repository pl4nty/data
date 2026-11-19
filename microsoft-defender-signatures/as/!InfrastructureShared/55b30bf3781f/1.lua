-- Threat: !InfrastructureShared
-- Name: 55b30bf3781f
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(bm.get_imagepath())
if l_0_1 == nil or #l_0_1 < #l_0_0 then
  return mp.CLEAN
end
if string.find(l_0_1, l_0_0, 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
