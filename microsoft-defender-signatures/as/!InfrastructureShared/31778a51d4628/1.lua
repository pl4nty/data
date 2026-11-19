-- Threat: !InfrastructureShared
-- Name: 31778a51d4628
-- Type: 21

if (peattributes.isvbpcode == true or peattributes.isvbnative == true) and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
