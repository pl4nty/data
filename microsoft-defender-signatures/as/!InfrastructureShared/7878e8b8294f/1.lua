-- Threat: !InfrastructureShared
-- Name: 7878e8b8294f
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
