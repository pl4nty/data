-- Threat: !InfrastructureShared
-- Name: f5404edf5c07
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
