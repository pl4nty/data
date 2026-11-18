-- Threat: !InfrastructureShared
-- Name: 182789680d9ba
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
