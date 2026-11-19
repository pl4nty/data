-- Threat: !InfrastructureShared
-- Name: 4878e1246eb9
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
