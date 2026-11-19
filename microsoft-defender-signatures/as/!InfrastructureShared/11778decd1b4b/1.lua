-- Threat: !InfrastructureShared
-- Name: 11778decd1b4b
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
