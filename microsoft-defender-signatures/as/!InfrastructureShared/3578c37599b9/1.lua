-- Threat: !InfrastructureShared
-- Name: 3578c37599b9
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
