-- Threat: !InfrastructureShared
-- Name: 96786f63151e
-- Type: 21

if mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
