-- Threat: !InfrastructureShared
-- Name: 19b38780660b
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
return mp.INFECTED
