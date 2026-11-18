-- Threat: !InfrastructureShared
-- Name: 85b3e6c54368
-- Type: 21
-- Includes: BMLuaLib

if IsSharepointServer() then
  return mp.INFECTED
end
return mp.CLEAN
