-- Threat: !InfrastructureShared
-- Name: ec78035d69a9
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
