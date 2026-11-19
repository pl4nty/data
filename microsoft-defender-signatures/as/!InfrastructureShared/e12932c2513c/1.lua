-- Threat: !InfrastructureShared
-- Name: e12932c2513c
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE200.A") then
  return mp.INFECTED
end
return mp.CLEAN
