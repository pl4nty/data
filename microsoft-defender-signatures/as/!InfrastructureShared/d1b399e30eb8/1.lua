-- Threat: !InfrastructureShared
-- Name: d1b399e30eb8
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2:lower()
end
if l_0_0 ~= nil and (string.find(l_0_0, " /i ", 1, true) or string.find(l_0_0, " /package ", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
