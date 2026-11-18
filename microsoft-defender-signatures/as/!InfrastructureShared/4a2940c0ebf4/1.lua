-- Threat: !InfrastructureShared
-- Name: 4a2940c0ebf4
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.CLEAN
