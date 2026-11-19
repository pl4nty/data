-- Threat: !InfrastructureShared
-- Name: 10c6103f8cc12
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
