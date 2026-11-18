-- Threat: !InfrastructureShared
-- Name: 4278713c55e8
-- Type: 21
-- Includes: HstrLuaLib

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
