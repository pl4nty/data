-- Threat: !InfrastructureShared
-- Name: 5d7802a90b4e
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
