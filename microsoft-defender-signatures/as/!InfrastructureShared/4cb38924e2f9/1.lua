-- Threat: !InfrastructureShared
-- Name: 4cb38924e2f9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = reportAVExcludedEntities()
if next(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
