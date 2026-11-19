-- Threat: !InfrastructureShared
-- Name: 12f78f866b239
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
