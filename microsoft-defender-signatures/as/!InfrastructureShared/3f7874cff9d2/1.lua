-- Threat: !InfrastructureShared
-- Name: 3f7874cff9d2
-- Type: 21
-- Includes: HstrLuaLib

if mp.get_mpattribute("RPF:TopLevelFile") and candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
