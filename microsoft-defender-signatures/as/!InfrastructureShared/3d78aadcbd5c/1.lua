-- Threat: !InfrastructureShared
-- Name: 3d78aadcbd5c
-- Type: 21

if (peattributes.isvbpcode == true or peattributes.isvbnative == true) and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
