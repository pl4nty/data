-- Threat: !InfrastructureShared
-- Name: 19b78bcc7bab7
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
