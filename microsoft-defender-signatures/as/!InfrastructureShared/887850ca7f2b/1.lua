-- Threat: !InfrastructureShared
-- Name: 887850ca7f2b
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
