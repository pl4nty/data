-- Threat: !InfrastructureShared
-- Name: 6f789eae7d26
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
