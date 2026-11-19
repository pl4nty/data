-- Threat: !InfrastructureShared
-- Name: 2478e0fc38da
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
