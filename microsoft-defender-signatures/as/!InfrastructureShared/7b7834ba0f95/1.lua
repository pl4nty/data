-- Threat: !InfrastructureShared
-- Name: 7b7834ba0f95
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
