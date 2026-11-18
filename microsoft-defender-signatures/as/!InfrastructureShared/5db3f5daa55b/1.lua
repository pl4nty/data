-- Threat: !InfrastructureShared
-- Name: 5db3f5daa55b
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "([^\\]+)$")
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "~1:", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
