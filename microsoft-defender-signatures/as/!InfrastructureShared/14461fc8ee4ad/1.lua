-- Threat: !InfrastructureShared
-- Name: 14461fc8ee4ad
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
