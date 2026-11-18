-- Threat: !InfrastructureShared
-- Name: 1d540665516ba
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
