-- Threat: !InfrastructureShared
-- Name: e540e4e57960
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
