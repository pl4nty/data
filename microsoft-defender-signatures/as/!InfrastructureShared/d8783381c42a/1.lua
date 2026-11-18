-- Threat: !InfrastructureShared
-- Name: d8783381c42a
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
