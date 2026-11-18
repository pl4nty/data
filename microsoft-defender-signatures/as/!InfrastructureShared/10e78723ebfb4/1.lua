-- Threat: !InfrastructureShared
-- Name: 10e78723ebfb4
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
