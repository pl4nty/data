-- Threat: !InfrastructureShared
-- Name: 5d7888f4223c
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
