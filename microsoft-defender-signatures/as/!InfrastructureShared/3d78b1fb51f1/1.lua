-- Threat: !InfrastructureShared
-- Name: 3d78b1fb51f1
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
