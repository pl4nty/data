-- Threat: !InfrastructureShared
-- Name: 3478f317b9f8
-- Type: 21

if mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
