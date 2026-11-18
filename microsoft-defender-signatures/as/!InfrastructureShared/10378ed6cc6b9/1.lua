-- Threat: !InfrastructureShared
-- Name: 10378ed6cc6b9
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
