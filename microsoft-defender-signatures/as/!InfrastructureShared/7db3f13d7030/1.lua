-- Threat: !InfrastructureShared
-- Name: 7db3f13d7030
-- Type: 21

local l_0_0 = 0
if this_sigattrlog[3].matched then
  l_0_0 = l_0_0 + 1
elseif this_sigattrlog[1].matched then
  l_0_0 = l_0_0 + 1
elseif this_sigattrlog[4].matched then
  l_0_0 = l_0_0 + 1
elseif this_sigattrlog[2].matched then
  l_0_0 = l_0_0 + 1
elseif this_sigattrlog[5].matched then
  l_0_0 = l_0_0 + 1
elseif this_sigattrlog[6].matched then
  l_0_0 = l_0_0 + 1
end
if 4 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
