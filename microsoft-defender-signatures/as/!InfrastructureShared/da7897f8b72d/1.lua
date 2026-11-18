-- Threat: !InfrastructureShared
-- Name: da7897f8b72d
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
