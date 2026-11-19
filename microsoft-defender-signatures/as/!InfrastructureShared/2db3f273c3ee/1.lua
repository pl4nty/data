-- Threat: !InfrastructureShared
-- Name: 2db3f273c3ee
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[1]
if not l_0_0 or not l_0_0.utf8p2 then
  return mp.CLEAN
end
takeMemorySnapshot(l_0_0.utf8p2)
return mp.INFECTED
