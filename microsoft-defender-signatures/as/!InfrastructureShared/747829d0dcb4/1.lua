-- Threat: !InfrastructureShared
-- Name: 747829d0dcb4
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
