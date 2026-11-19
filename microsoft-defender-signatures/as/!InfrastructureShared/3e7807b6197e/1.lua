-- Threat: !InfrastructureShared
-- Name: 3e7807b6197e
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
