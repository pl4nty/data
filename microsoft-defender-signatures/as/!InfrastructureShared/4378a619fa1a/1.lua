-- Threat: !InfrastructureShared
-- Name: 4378a619fa1a
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
