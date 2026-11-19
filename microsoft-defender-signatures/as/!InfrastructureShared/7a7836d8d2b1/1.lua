-- Threat: !InfrastructureShared
-- Name: 7a7836d8d2b1
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
