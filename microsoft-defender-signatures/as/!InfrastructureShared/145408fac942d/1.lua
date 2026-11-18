-- Threat: !InfrastructureShared
-- Name: 145408fac942d
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
