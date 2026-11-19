-- Threat: !InfrastructureShared
-- Name: 5d2958f15365
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.CLEAN
