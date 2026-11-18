-- Threat: !InfrastructureShared
-- Name: cd410f96a1d9
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5
if this_sigattrlog[5].matched and this_sigattrlog[5].np2 ~= nil then
  l_0_0 = this_sigattrlog[5].np2
end
if this_sigattrlog[6].matched and this_sigattrlog[6].np2 then
  l_0_1 = this_sigattrlog[6].np2
end
if this_sigattrlog[7].matched and this_sigattrlog[7].np2 then
  l_0_2 = this_sigattrlog[7].np2
end
if this_sigattrlog[8].matched and this_sigattrlog[8].np2 then
  l_0_3 = this_sigattrlog[8].np2
end
if this_sigattrlog[9].matched and this_sigattrlog[9].np2 then
  l_0_4 = this_sigattrlog[9].np2
end
if this_sigattrlog[10].matched and this_sigattrlog[10].np2 then
  l_0_5 = this_sigattrlog[10].np2
end
if l_0_0 ~= nil and l_0_1 ~= nil and l_0_2 ~= nil and l_0_3 ~= nil and l_0_4 ~= nil and l_0_5 ~= nil and l_0_0 ~= "" and l_0_1 ~= "" and l_0_2 ~= "" and l_0_3 ~= "" and l_0_4 ~= "" and l_0_5 ~= "" and l_0_0 == l_0_2 and l_0_1 == l_0_3 and l_0_2 == l_0_4 and l_0_3 == l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
