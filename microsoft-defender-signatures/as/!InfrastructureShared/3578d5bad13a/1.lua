-- Threat: !InfrastructureShared
-- Name: 3578d5bad13a
-- Type: 21

if mp.getfilesize() < 5242880 then
  return mp.INFECTED
end
return mp.CLEAN
