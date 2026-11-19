-- Threat: !InfrastructureShared
-- Name: 7d29361a4e06
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE200.A") then
  return mp.INFECTED
end
return mp.CLEAN
