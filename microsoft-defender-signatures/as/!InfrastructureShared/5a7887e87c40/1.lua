-- Threat: !InfrastructureShared
-- Name: 5a7887e87c40
-- Type: 21

if (peattributes.isvbnative or peattributes.isvbpcode) and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
