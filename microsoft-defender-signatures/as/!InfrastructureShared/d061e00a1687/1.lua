-- Threat: !InfrastructureShared
-- Name: d061e00a1687
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
