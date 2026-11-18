-- Threat: !InfrastructureShared
-- Name: 4629f9505e2e
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.CLEAN
