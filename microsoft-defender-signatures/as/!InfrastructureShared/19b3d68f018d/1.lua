-- Threat: !InfrastructureShared
-- Name: 19b3d68f018d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[1]
if not l_0_0 or not l_0_0.utf8p2 then
  return mp.CLEAN
end
takeMemorySnapshot(l_0_0.utf8p2)
return mp.INFECTED
