-- Threat: !InfrastructureShared
-- Name: 6c7807cdf6ab
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
