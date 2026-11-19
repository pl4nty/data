-- Threat: !InfrastructureShared
-- Name: 1e6785e4361da
-- Type: 21

if mp.getfilesize() < 2048000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
