-- Threat: !InfrastructureShared
-- Name: 247b3c0091072
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p2
end
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[12].utf8p2
end
if this_sigattrlog[13].matched and this_sigattrlog[13].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[13].utf8p2
end
if this_sigattrlog[14].matched and this_sigattrlog[14].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[14].utf8p2
end
if l_0_0 ~= nil and l_0_0 ~= "" and l_0_1 ~= nil and l_0_1 ~= "" and l_0_2 ~= nil and l_0_2 ~= "" and l_0_3 ~= nil and l_0_3 ~= "" and l_0_0 ~= l_0_1 and l_0_0 ~= l_0_2 and l_0_0 ~= l_0_3 and l_0_1 ~= l_0_2 and l_0_1 ~= l_0_3 and l_0_2 ~= l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
