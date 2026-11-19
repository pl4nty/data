-- Threat: !InfrastructureShared
-- Name: 2f299e6e4b7a
-- Type: 21

if not mp.get_mpattribute("Possible_PhpCode") then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:MDExt") then
  return mp.CLEAN
end
if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.LOWFI
