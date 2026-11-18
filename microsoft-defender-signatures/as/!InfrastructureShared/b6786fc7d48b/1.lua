-- Threat: !InfrastructureShared
-- Name: b6786fc7d48b
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
