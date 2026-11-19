-- Threat: !InfrastructureShared
-- Name: fc788ce1a097
-- Type: 21

if pehdr.NumberOfSections == 3 and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
