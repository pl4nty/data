-- Threat: !InfrastructureShared
-- Name: 55b3fe5af005
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED
