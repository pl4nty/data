-- Threat: !InfrastructureShared
-- Name: bb7849da80f6
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
