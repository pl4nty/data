-- Threat: !InfrastructureShared
-- Name: 25b301e08019
-- Type: 21
-- Includes: BMLuaLib

if IsInThirdPartySecurityPath() == true then
  return mp.CLEAN
end
return mp.INFECTED
