-- Threat: !InfrastructureShared
-- Name: 12cb38c022871
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
local l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p1
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(string.lower(l_0_0), "([^\\]+)$")
local l_0_3 = string.match(string.lower(l_0_1), "([^\\]+)$")
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
if #l_0_3 > #l_0_2 and string.sub(l_0_3, 1, #l_0_2) == l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
