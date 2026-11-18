-- Threat: !InfrastructureShared
-- Name: b778b1ed654b
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE5000.A") then
  return mp.INFECTED
end
return mp.CLEAN
