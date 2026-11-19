-- Threat: !InfrastructureShared
-- Name: 15b78d4712783
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
