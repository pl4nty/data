-- Threat: !InfrastructureShared
-- Name: 1807829d37cfa
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
