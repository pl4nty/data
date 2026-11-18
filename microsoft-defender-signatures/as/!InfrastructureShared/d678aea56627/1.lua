-- Threat: !InfrastructureShared
-- Name: d678aea56627
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
