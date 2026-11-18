-- Threat: !InfrastructureShared
-- Name: 19b36f71ae2c
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
if string.match(l_0_0, "advfirewall firewall add rule name=.+program=.+\\rundll32%.exe") then
  return mp.INFECTED
end
return mp.CLEAN
