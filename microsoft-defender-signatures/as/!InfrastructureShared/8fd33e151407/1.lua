-- Threat: !InfrastructureShared
-- Name: 8fd33e151407
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeGT1M.A") then
  return mp.INFECTED
end
return mp.CLEAN
