-- Threat: !InfrastructureShared
-- Name: bb78e1707e4e
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
