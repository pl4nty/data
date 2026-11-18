-- Threat: !InfrastructureShared
-- Name: 64780a359eb5
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
