-- Threat: !InfrastructureShared
-- Name: b0b32ae5e901
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if l_0_0 then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
