-- Threat: !InfrastructureShared
-- Name: 82784464dd2c
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
