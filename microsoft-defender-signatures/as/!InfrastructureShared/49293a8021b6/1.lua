-- Threat: !InfrastructureShared
-- Name: 49293a8021b6
-- Type: 21

if mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN
