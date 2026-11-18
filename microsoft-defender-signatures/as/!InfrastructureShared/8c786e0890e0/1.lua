-- Threat: !InfrastructureShared
-- Name: 8c786e0890e0
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
