-- Threat: !InfrastructureShared
-- Name: 19a78bcc1c81a
-- Type: 21

if mp.getfilesize() < 2024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
