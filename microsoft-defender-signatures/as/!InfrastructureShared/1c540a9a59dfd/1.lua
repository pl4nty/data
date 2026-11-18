-- Threat: !InfrastructureShared
-- Name: 1c540a9a59dfd
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
