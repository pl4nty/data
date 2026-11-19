-- Threat: !InfrastructureShared
-- Name: 8178ebe3f189
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
