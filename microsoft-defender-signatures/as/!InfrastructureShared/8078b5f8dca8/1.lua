-- Threat: !InfrastructureShared
-- Name: 8078b5f8dca8
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
