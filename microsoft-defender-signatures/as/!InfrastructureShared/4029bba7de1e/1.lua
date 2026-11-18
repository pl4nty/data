-- Threat: !InfrastructureShared
-- Name: 4029bba7de1e
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.CLEAN
