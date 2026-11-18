-- Threat: !InfrastructureShared
-- Name: 7db343eb3ae5
-- Type: 21
-- Includes: BMLuaLib

if IsInThirdPartySecurityPath() == true then
  return mp.CLEAN
end
return mp.INFECTED
