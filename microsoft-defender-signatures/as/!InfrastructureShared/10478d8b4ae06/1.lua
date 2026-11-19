-- Threat: !InfrastructureShared
-- Name: 10478d8b4ae06
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
