-- Threat: !InfrastructureShared
-- Name: 6a294d4e112f
-- Type: 21

if not mp.get_mpattribute("Possible_PhpCode") then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:MDExt") then
  return mp.CLEAN
end
return mp.INFECTED
