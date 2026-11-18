-- Threat: !InfrastructureShared
-- Name: d2b784f630b12
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
