-- Threat: !InfrastructureShared
-- Name: d5408d0ad420
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
