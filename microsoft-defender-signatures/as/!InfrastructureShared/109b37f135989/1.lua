-- Threat: !InfrastructureShared
-- Name: 109b37f135989
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
else
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 ~= nil and string.find(l_0_0, "*.doc", 1, true) and string.find(l_0_0, "*.xls", 1, true) and string.find(l_0_0, "*.ppt", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
