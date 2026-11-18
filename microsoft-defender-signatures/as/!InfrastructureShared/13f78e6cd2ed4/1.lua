-- Threat: !InfrastructureShared
-- Name: 13f78e6cd2ed4
-- Type: 21

if (peattributes.isvbpcode == true or peattributes.isvbnative == true) and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
