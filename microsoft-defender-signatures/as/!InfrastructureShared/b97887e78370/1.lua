-- Threat: !InfrastructureShared
-- Name: b97887e78370
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("LUA:FileSizeLE5000.A") and mp.get_mpattribute("pea_headerchecksum0") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
