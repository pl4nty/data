-- Threat: !InfrastructureShared
-- Name: 8e782b44835c
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
