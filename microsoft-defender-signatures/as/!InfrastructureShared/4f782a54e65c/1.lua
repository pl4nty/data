-- Threat: !InfrastructureShared
-- Name: 4f782a54e65c
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
