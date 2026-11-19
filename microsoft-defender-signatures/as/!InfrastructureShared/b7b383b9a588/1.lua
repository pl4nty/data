-- Threat: !InfrastructureShared
-- Name: b7b383b9a588
-- Type: 21
-- Includes: BMLuaLib

if IsInThirdPartySecurityPath() == true then
  return mp.CLEAN
end
return mp.INFECTED
