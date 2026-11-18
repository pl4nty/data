-- Threat: !InfrastructureShared
-- Name: 135614520e48f
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
