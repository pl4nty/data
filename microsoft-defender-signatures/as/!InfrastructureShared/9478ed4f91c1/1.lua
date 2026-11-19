-- Threat: !InfrastructureShared
-- Name: 9478ed4f91c1
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
