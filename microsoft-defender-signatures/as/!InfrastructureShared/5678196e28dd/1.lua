-- Threat: !InfrastructureShared
-- Name: 5678196e28dd
-- Type: 21

if mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
