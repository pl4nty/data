-- Threat: !InfrastructureShared
-- Name: 18978e70c2a82
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
