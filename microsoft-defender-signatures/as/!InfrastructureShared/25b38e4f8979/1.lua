-- Threat: !InfrastructureShared
-- Name: 25b38e4f8979
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED
