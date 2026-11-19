-- Threat: !InfrastructureShared
-- Name: 5ab3542a2c85
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_2 = this_sigattrlog[1].utf8p2
  l_0_0 = this_sigattrlog[1].ppid
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p2
end
if not (l_0_0 and l_0_1) or not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_2, "/([^/]+)$")
if not l_0_3 then
  return mp.CLEAN
end
if string.find(l_0_1, l_0_3, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
