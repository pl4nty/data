-- Threat: !InfrastructureShared
-- Name: 43b3fe8749ff
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 ~= nil and l_0_0 ~= "" and StringEndsWith(l_0_0, ".elf") then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
