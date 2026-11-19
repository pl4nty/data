-- Threat: !InfrastructureShared
-- Name: 8a788b4a29a2
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
