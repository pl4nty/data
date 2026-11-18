-- Threat: !InfrastructureShared
-- Name: 43b3b2592d6f
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if string.find(l_0_0, "echo 1", 1, true) and string.find(l_0_1, "/proc/sys/net/ip", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
