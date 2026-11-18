-- Threat: !InfrastructureShared
-- Name: 240b31c38200e
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].timestamp ~= nil then
  l_0_0 = this_sigattrlog[1].timestamp
elseif this_sigattrlog[2].matched and this_sigattrlog[2].timestamp ~= nil then
  l_0_0 = this_sigattrlog[2].timestamp
elseif this_sigattrlog[3].matched and this_sigattrlog[3].timestamp ~= nil then
  l_0_0 = this_sigattrlog[3].timestamp
elseif this_sigattrlog[4].matched and this_sigattrlog[4].timestamp ~= nil then
  l_0_0 = this_sigattrlog[4].timestamp
elseif this_sigattrlog[5].matched and this_sigattrlog[5].timestamp ~= nil then
  l_0_0 = this_sigattrlog[5].timestamp
elseif this_sigattrlog[6].matched and this_sigattrlog[6].timestamp ~= nil then
  l_0_0 = this_sigattrlog[6].timestamp
elseif this_sigattrlog[7].matched and this_sigattrlog[7].timestamp ~= nil then
  l_0_0 = this_sigattrlog[7].timestamp
elseif this_sigattrlog[8].matched and this_sigattrlog[8].timestamp ~= nil then
  l_0_0 = this_sigattrlog[8].timestamp
elseif this_sigattrlog[9].matched and this_sigattrlog[9].timestamp ~= nil then
  l_0_0 = this_sigattrlog[9].timestamp
elseif this_sigattrlog[10].matched and this_sigattrlog[10].timestamp ~= nil then
  l_0_0 = this_sigattrlog[10].timestamp
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[12].matched and this_sigattrlog[12].timestamp ~= nil then
  l_0_1 = this_sigattrlog[12].timestamp
elseif this_sigattrlog[13].matched and this_sigattrlog[13].timestamp ~= nil then
  l_0_1 = this_sigattrlog[13].timestamp
end
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_0 < l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
