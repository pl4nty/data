-- Threat: !InfrastructureShared
-- Name: 32b39602d663
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 then
  taint(l_0_0, "static_hit", 1800)
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
