-- Threat: !InfrastructureShared
-- Name: a1783559b2ba
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
