-- Threat: !InfrastructureShared
-- Name: 10540e09537ef
-- Type: 21

if mp.get_mpattribute("pea_headerchecksum0") and mp.get_mpattribute("LUA:FileSizeLE1M.A") then
  return mp.INFECTED
end
return mp.CLEAN
