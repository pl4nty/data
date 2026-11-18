-- Threat: !InfrastructureShared
-- Name: 8678f870b1f6
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("LUA:FileSizeLE2000.A") and mp.get_mpattribute("pea_headerchecksum0") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
