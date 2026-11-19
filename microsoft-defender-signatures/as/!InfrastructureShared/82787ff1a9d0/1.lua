-- Threat: !InfrastructureShared
-- Name: 82787ff1a9d0
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
