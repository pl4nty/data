-- Threat: !InfrastructureShared
-- Name: 9378ba5a00c2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
