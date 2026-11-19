-- Threat: !InfrastructureShared
-- Name: 5878aca5f15a
-- Type: 21

if (peattributes.isvbnative or peattributes.isvbpcode) and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
