-- Threat: !InfrastructureShared
-- Name: b361fd04a925
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
