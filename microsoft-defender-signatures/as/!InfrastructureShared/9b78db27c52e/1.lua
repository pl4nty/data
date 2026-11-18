-- Threat: !InfrastructureShared
-- Name: 9b78db27c52e
-- Type: 21
-- Includes: HstrLuaLib

if not pehdr.Machine == 332 then
  return mp.CLEAN
end
if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if candidatePeFile() then
  return mp.INFECTED
end
return mp.CLEAN
