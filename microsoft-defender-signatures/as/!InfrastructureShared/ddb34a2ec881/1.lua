-- Threat: !InfrastructureShared
-- Name: ddb34a2ec881
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_0 == l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
