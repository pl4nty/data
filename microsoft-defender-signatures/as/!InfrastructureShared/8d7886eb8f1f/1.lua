-- Threat: !InfrastructureShared
-- Name: 8d7886eb8f1f
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
