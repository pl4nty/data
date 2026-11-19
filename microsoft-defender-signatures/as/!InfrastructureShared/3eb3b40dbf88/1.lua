-- Threat: !InfrastructureShared
-- Name: 3eb3b40dbf88
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, " privacy", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
