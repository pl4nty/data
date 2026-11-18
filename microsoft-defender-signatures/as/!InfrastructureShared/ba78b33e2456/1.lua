-- Threat: !InfrastructureShared
-- Name: ba78b33e2456
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
