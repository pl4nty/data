-- Threat: !InfrastructureShared
-- Name: 9778a14d0f86
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
