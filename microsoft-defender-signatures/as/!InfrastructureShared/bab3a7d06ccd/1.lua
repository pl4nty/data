-- Threat: !InfrastructureShared
-- Name: bab3a7d06ccd
-- Type: 21

local l_0_0 = this_sigattrlog[3].utf8p1
local l_0_1 = this_sigattrlog[3].utf8p2
if not l_0_0 or not l_0_1 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "\\temp\\", 1, true) then
  return mp.CLEAN
end
l_0_0 = string.match(l_0_0, "([^\\]+)$")
if string.find(l_0_0, "unins", 1, true) then
  return mp.CLEAN
end
l_0_1 = string.lower(string.match(l_0_1, "([^\\]+)$"))
if l_0_0 ~= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
