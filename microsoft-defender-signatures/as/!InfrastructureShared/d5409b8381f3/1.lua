-- Threat: !InfrastructureShared
-- Name: d5409b8381f3
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE1M.A") then
  return mp.INFECTED
end
return mp.CLEAN
