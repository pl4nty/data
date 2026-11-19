-- Threat: !InfrastructureShared
-- Name: 133b320281349
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5]
end
if l_0_0 == nil then
  return mp.CLEAN
end
if not this_sigattrlog[6].matched then
  return mp.CLEAN
end
if l_0_0.timestamp == nil then
  return mp.CLEAN
end
if this_sigattrlog[6].timestamp == nil then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[6].timestamp - l_0_0.timestamp
if l_0_1 < 0 then
  return mp.CLEAN
end
if 50000000 < l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
