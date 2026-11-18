-- Threat: !InfrastructureShared
-- Name: 205b397b9510b
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[8].utf8p2
end
if l_0_0 ~= nil and string.find(l_0_1, l_0_0, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
