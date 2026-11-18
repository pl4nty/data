-- Threat: !InfrastructureShared
-- Name: 1e54062bc6706
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
