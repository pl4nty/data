-- Threat: !InfrastructureShared
-- Name: cd783220f00d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
