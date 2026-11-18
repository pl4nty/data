-- Threat: !InfrastructureShared
-- Name: 5829700bfc03
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.CLEAN
