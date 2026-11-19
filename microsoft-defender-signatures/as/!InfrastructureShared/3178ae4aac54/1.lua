-- Threat: !InfrastructureShared
-- Name: 3178ae4aac54
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE1M.A") then
  return mp.INFECTED
end
return mp.CLEAN
