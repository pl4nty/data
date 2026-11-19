-- Threat: !InfrastructureShared
-- Name: 5429cb3952a5
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.CLEAN
