-- Threat: !InfrastructureShared
-- Name: 14789ad43bfc
-- Type: 21

if mp.get_mpattribute("pea_isexe") and peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
