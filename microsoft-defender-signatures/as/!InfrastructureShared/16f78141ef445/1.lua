-- Threat: !InfrastructureShared
-- Name: 16f78141ef445
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
