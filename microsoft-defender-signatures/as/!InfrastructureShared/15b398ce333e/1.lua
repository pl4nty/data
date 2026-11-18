-- Threat: !InfrastructureShared
-- Name: 15b398ce333e
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED
