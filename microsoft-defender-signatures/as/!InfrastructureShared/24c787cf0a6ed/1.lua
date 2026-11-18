-- Threat: !InfrastructureShared
-- Name: 24c787cf0a6ed
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
