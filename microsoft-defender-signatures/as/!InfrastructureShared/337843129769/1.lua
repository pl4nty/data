-- Threat: !InfrastructureShared
-- Name: 337843129769
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
