-- Threat: !InfrastructureShared
-- Name: 6b785102a916
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
