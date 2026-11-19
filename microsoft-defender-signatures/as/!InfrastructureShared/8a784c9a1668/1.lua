-- Threat: !InfrastructureShared
-- Name: 8a784c9a1668
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
