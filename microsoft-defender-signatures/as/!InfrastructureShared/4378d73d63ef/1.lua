-- Threat: !InfrastructureShared
-- Name: 4378d73d63ef
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
