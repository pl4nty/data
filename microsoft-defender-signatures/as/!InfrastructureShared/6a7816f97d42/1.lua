-- Threat: !InfrastructureShared
-- Name: 6a7816f97d42
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
