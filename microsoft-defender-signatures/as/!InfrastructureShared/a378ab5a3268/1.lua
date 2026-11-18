-- Threat: !InfrastructureShared
-- Name: a378ab5a3268
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
