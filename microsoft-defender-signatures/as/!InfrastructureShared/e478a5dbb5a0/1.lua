-- Threat: !InfrastructureShared
-- Name: e478a5dbb5a0
-- Type: 21

if mp.getfilesize() < 1048000 and pehdr.NumberOfSections <= 5 and pesecs[5].Name == "" then
  return mp.INFECTED
end
return mp.CLEAN
