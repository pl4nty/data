-- Threat: !InfrastructureShared
-- Name: 15478eb0d095e
-- Type: 21

if mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
