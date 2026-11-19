-- Threat: !InfrastructureShared
-- Name: 1c29cd5ac93b
-- Type: 21

if mp.getfilesize() <= 10240 and mp.getfilesize() >= 3072 then
  return mp.INFECTED
end
return mp.CLEAN
