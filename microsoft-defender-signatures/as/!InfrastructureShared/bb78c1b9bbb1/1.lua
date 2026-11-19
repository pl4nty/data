-- Threat: !InfrastructureShared
-- Name: bb78c1b9bbb1
-- Type: 21

if peattributes.isexe and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
