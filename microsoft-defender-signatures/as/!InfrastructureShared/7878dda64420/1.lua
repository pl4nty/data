-- Threat: !InfrastructureShared
-- Name: 7878dda64420
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
