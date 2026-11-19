-- Threat: !InfrastructureShared
-- Name: 4378fa6ceb27
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
