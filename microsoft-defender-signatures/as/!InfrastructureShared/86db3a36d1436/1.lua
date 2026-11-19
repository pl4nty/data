-- Threat: !InfrastructureShared
-- Name: 86db3a36d1436
-- Type: 21

if this_sigattrlog[50].matched == false or this_sigattrlog[50].timestamp == nil then
  return mp.CLEAN
end
if this_sigattrlog[51].matched == false or this_sigattrlog[51].timestamp == nil then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[50].timestamp
local l_0_1 = this_sigattrlog[51].timestamp
if l_0_0 > l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1 - l_0_0
if l_0_2 < 600000000 then
  return mp.CLEAN
end
return mp.INFECTED
