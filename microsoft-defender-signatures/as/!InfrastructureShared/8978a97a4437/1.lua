-- Threat: !InfrastructureShared
-- Name: 8978a97a4437
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
