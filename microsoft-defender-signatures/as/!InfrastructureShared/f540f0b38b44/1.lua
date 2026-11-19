-- Threat: !InfrastructureShared
-- Name: f540f0b38b44
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
