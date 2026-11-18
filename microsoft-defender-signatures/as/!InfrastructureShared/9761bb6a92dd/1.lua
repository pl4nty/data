-- Threat: !InfrastructureShared
-- Name: 9761bb6a92dd
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
