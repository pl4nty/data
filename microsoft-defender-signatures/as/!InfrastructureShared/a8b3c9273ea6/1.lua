-- Threat: !InfrastructureShared
-- Name: a8b3c9273ea6
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].timestamp ~= nil then
  l_0_0 = this_sigattrlog[1].timestamp
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].timestamp ~= nil then
  l_0_1 = this_sigattrlog[3].timestamp
end
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_0 < l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
