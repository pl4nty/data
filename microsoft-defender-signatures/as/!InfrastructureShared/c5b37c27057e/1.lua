-- Threat: !InfrastructureShared
-- Name: c5b37c27057e
-- Type: 21
-- Includes: BMLuaLib

if IsADConnectRole() then
  return mp.INFECTED
end
return mp.CLEAN
