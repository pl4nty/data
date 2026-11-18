-- Threat: !InfrastructureShared
-- Name: 41b30f6dae5f
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
_, l_0_1 = string.match(l_0_0, "(.-)([^\\]-)$")
local l_0_2 = bm.get_imagepath()
local l_0_3
if l_0_2 ~= nil then
  _, l_0_3 = string.match(l_0_2, "(.-)([^\\]-)$")
end
if l_0_3 ~= nil and l_0_1 ~= nil and string.lower(l_0_3) == string.lower(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
