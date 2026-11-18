-- Threat: !InfrastructureShared
-- Name: 29785523de6c
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
