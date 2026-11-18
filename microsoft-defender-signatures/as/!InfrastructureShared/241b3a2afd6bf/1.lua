-- Threat: !InfrastructureShared
-- Name: 241b3a2afd6bf
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
  l_0_1 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[2].matched and this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
  l_0_1 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
  l_0_1 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
  l_0_1 = this_sigattrlog[8].utf8p1
else
  return mp.CLEAN
end
if not l_0_0 or not l_0_1 then
  return mp.CLEAN
end
if l_0_0:lower() ~= l_0_1:lower() then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
return mp.INFECTED
