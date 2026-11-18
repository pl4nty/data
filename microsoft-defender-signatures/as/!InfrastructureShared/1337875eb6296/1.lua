-- Threat: !InfrastructureShared
-- Name: 1337875eb6296
-- Type: 21
-- Includes: HstrLuaLib

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if peattributes.isdll then
  return mp.CLEAN
end
if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
