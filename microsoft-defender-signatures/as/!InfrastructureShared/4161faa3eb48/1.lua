-- Threat: !InfrastructureShared
-- Name: 4161faa3eb48
-- Type: 21

if peattributes.ismsil and pehdr.NumberOfSections == 3 and mp.getfilesize() == 80384 then
  return mp.INFECTED
end
return mp.CLEAN
