-- Threat: !InfrastructureShared
-- Name: 1f678ffb56ff9
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
