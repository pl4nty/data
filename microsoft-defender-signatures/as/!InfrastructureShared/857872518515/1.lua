-- Threat: !InfrastructureShared
-- Name: 857872518515
-- Type: 21

if mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
