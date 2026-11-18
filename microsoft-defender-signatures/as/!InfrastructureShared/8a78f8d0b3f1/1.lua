-- Threat: !InfrastructureShared
-- Name: 8a78f8d0b3f1
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
