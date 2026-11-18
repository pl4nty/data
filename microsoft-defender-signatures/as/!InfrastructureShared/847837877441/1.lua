-- Threat: !InfrastructureShared
-- Name: 847837877441
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_headerchecksum0") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
