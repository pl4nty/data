-- Threat: !InfrastructureShared
-- Name: 3f29f9c3141d
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.CLEAN
