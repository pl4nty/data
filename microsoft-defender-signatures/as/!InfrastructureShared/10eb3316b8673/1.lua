-- Threat: !InfrastructureShared
-- Name: 10eb3316b8673
-- Type: 21

local l_0_0
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p2
end
if l_0_0 ~= nil and (string.find(l_0_0, ".sct", 1, true) or string.find(l_0_0, "/i:http", 1, true) or string.find(l_0_0, "/u ", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
