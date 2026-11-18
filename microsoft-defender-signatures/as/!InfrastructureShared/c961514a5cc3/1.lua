-- Threat: !InfrastructureShared
-- Name: c961514a5cc3
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
