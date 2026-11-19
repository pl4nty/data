-- Threat: !InfrastructureShared
-- Name: 35788baffc24
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
