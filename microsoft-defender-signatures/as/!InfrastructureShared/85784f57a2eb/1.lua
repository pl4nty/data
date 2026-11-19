-- Threat: !InfrastructureShared
-- Name: 85784f57a2eb
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
