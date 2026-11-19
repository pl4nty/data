-- Threat: !InfrastructureShared
-- Name: 45403bf0eed5
-- Type: 21

if mp.get_mpattribute("pea_headerchecksum0") and mp.get_mpattribute("LUA:FileSizeLE1M.A") then
  return mp.INFECTED
end
return mp.CLEAN
