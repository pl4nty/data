-- Threat: !InfrastructureShared
-- Name: ca783a17f4bf
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
