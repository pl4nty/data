-- Threat: !InfrastructureShared
-- Name: 27f78e370d394
-- Type: 21

if mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
