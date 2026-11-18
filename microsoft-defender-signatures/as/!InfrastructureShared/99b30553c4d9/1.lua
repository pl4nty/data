-- Threat: !InfrastructureShared
-- Name: 99b30553c4d9
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
  l_0_0 = l_0_1:match("([^\\]+)$")
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_3 = string.lower(this_sigattrlog[3].utf8p2)
  l_0_2 = l_0_3:match("/injectrunning%s+[^%s\"]+\\([^\\\"]+%.%w+)")
end
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_0 == l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
