-- Threat: !InfrastructureShared
-- Name: 876123fdecaf
-- Type: 21

if peattributes.isexe == true and (pehdr.NumberOfSections == 3 or pehdr.NumberOfSections == 4) then
  return mp.INFECTED
end
return mp.CLEAN
