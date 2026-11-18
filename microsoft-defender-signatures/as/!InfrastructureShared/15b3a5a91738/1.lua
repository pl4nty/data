-- Threat: !InfrastructureShared
-- Name: 15b3a5a91738
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED
