-- Threat: !InfrastructureShared
-- Name: 3c291776d021
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.CLEAN
