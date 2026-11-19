-- Threat: !InfrastructureShared
-- Name: 69b33ca698c4
-- Type: 21

local l_0_0 = this_sigattrlog[5]
if not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].timestamp
elseif this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].timestamp
elseif this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].timestamp
else
  return mp.CLEAN
end
local l_0_2 = l_0_0.timestamp
if type(l_0_1) ~= "number" or type(l_0_2) ~= "number" then
  return mp.CLEAN
end
if l_0_1 <= 0 or l_0_2 <= 0 then
  return mp.CLEAN
end
if l_0_1 > l_0_2 then
  return mp.CLEAN
end
if 100000000 < l_0_2 - l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
