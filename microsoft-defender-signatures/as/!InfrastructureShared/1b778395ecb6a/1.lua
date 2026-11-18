-- Threat: !InfrastructureShared
-- Name: 1b778395ecb6a
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
