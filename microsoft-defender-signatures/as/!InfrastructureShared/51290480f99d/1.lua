-- Threat: !InfrastructureShared
-- Name: 51290480f99d
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.CLEAN
