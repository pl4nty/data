-- Threat: !InfrastructureShared
-- Name: 6d78de0e568a
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
