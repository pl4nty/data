-- Threat: !InfrastructureShared
-- Name: 1de780041b66a
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
