-- Threat: !InfrastructureShared
-- Name: 12378cf335e8f
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
