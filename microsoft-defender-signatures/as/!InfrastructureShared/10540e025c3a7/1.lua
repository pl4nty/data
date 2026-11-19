-- Threat: !InfrastructureShared
-- Name: 10540e025c3a7
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
