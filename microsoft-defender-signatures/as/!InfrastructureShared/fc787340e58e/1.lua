-- Threat: !InfrastructureShared
-- Name: fc787340e58e
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
