-- Threat: !InfrastructureShared
-- Name: af6127568cb5
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
