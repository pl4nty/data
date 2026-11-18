-- Threat: !InfrastructureShared
-- Name: 1127822aa3f8f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
