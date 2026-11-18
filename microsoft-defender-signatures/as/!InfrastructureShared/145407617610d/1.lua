-- Threat: !InfrastructureShared
-- Name: 145407617610d
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
