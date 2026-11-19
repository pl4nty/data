-- Threat: !InfrastructureShared
-- Name: 35b3272c1a05
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED
