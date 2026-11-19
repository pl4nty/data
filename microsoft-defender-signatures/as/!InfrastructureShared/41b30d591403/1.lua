-- Threat: !InfrastructureShared
-- Name: 41b30d591403
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if string.find(l_0_0, ".config/autostart", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
