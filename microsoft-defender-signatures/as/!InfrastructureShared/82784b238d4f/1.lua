-- Threat: !InfrastructureShared
-- Name: 82784b238d4f
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
