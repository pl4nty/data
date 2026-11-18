-- Threat: !InfrastructureShared
-- Name: 4878694a7c19
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
