-- Threat: !InfrastructureShared
-- Name: 15b3dcbc00a2
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED
