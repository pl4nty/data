-- Threat: !InfrastructureShared
-- Name: 7a784c796b2c
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
