-- Threat: !InfrastructureShared
-- Name: 8e614a2a4a6c
-- Type: 21

if (peattributes.isvbpcode == true or peattributes.isvbnative == true) and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
