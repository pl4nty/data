-- Threat: !InfrastructureShared
-- Name: 8c783c9f5aea
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
