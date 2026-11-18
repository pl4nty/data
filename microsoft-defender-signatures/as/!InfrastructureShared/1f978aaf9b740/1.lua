-- Threat: !InfrastructureShared
-- Name: 1f978aaf9b740
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections <= 5 then
  return mp.INFECTED
end
return mp.CLEAN
