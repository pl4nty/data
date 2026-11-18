-- Threat: !InfrastructureShared
-- Name: 73b3a29cd45e
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "/impacket/", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
