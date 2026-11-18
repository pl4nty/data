-- Threat: !InfrastructureShared
-- Name: 41b383bf8322
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED
