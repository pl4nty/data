-- Threat: !InfrastructureShared
-- Name: 14540b056f2f8
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
