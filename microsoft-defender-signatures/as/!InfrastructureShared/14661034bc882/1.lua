-- Threat: !InfrastructureShared
-- Name: 14661034bc882
-- Type: 21

if mp.getfilesize() > 400000 and mp.getfilesize() < 600000 and pehdr.NumberOfSections == 3 and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
