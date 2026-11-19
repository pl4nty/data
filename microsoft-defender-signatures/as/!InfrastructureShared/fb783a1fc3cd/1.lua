-- Threat: !InfrastructureShared
-- Name: fb783a1fc3cd
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
