-- Threat: !InfrastructureShared
-- Name: 7db39926a712
-- Type: 21
-- Includes: BMLuaLib

if IsInThirdPartySecurityPath() == true then
  return mp.CLEAN
end
return mp.INFECTED
