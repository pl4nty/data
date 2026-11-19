-- Threat: !InfrastructureShared
-- Name: 45b32480d311
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
