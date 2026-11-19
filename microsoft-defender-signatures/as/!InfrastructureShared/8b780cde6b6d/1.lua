-- Threat: !InfrastructureShared
-- Name: 8b780cde6b6d
-- Type: 21

if hstrlog[6].hitcount >= 7 and pehdr.NumberOfSections == 3 and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
