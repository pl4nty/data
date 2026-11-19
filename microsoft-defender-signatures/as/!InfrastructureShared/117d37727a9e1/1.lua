-- Threat: !InfrastructureShared
-- Name: 117d37727a9e1
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeGT1M.A") then
  return mp.INFECTED
end
return mp.CLEAN
