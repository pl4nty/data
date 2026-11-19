-- Threat: !InfrastructureShared
-- Name: 14540eeb5ade1
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE1M.A") then
  return mp.INFECTED
end
return mp.CLEAN
