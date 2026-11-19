-- Threat: !InfrastructureShared
-- Name: 55b3c0f709fd
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED
