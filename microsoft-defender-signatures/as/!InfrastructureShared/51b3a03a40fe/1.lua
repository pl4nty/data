-- Threat: !InfrastructureShared
-- Name: 51b3a03a40fe
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
if not contains(l_0_0, "\\bdata.msc") then
  return mp.CLEAN
end
return mp.INFECTED
