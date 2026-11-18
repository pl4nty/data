-- Threat: !InfrastructureShared
-- Name: b8785a4a3e7f
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
