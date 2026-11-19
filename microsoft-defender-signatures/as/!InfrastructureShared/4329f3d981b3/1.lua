-- Threat: !InfrastructureShared
-- Name: 4329f3d981b3
-- Type: 21

if mp.getfilesize() <= 5120 then
  return mp.INFECTED
end
return mp.CLEAN
