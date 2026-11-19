-- Threat: !InfrastructureShared
-- Name: a1781c4b7d08
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
