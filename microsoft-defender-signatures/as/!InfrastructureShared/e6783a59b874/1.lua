-- Threat: !InfrastructureShared
-- Name: e6783a59b874
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") and mp.get_mpattribute("LUA:FileSizeLE1M.A") then
  return mp.INFECTED
end
return mp.CLEAN
