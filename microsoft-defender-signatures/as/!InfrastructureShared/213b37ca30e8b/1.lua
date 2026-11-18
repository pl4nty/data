-- Threat: !InfrastructureShared
-- Name: 213b37ca30e8b
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[10].utf8p1
end
if this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[11].utf8p1
end
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_3 = this_sigattrlog[12].utf8p1
end
if this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil then
  l_0_4 = this_sigattrlog[13].utf8p1
end
if this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 ~= nil then
  l_0_5 = this_sigattrlog[14].utf8p1
end
if l_0_0 ~= nil and l_0_0 == l_0_1 and l_0_1 == l_0_2 and l_0_2 == l_0_3 and l_0_3 == l_0_4 and l_0_4 == l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
