-- Threat: !InfrastructureShared
-- Name: 1a7782a603f5f
-- Type: 21

if hstrlog[14].hitcount >= 5 and pehdr.NumberOfSections == 3 and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
