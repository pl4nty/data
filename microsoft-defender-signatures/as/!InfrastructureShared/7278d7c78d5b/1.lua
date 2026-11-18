-- Threat: !InfrastructureShared
-- Name: 7278d7c78d5b
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
