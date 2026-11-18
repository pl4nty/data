-- Threat: !InfrastructureShared
-- Name: 332960f99e3b
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.CLEAN
