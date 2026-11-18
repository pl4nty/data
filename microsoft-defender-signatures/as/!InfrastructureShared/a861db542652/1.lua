-- Threat: !InfrastructureShared
-- Name: a861db542652
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
