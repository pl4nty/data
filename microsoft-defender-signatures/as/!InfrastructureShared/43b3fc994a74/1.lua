-- Threat: !InfrastructureShared
-- Name: 43b3fc994a74
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if analyzeEsxcliProcessPattern(l_0_0) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
