-- Threat: !InfrastructureShared
-- Name: 6c78023024aa
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
