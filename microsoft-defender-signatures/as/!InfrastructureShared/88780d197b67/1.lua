-- Threat: !InfrastructureShared
-- Name: 88780d197b67
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
