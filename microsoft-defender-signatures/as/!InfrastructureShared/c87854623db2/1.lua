-- Threat: !InfrastructureShared
-- Name: c87854623db2
-- Type: 21
-- Includes: HstrLuaLib

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
