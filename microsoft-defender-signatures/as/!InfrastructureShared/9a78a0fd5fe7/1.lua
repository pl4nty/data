-- Threat: !InfrastructureShared
-- Name: 9a78a0fd5fe7
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
