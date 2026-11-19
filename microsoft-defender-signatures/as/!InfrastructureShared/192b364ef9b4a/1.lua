-- Threat: !InfrastructureShared
-- Name: 192b364ef9b4a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p1)
end
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[9].utf8p2)
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[10].utf8p2)
end
local l_0_2 = GetFileName(l_0_0)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {"bedvitcom"}
if contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
if contains(l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
