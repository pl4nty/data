-- Threat: !InfrastructureShared
-- Name: 91299a468d52
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE200.A") then
  return mp.INFECTED
end
return mp.CLEAN
