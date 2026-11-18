-- Threat: !InfrastructureShared
-- Name: 5541aea6d269
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].np1
end
if this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].np1
end
if l_0_0 ~= nil and l_0_1 ~= nil and l_0_0 ~= "" and l_0_1 ~= "" and l_0_0 == l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
