-- Threat: !InfrastructureShared
-- Name: 22290e3894a4
-- Type: 21

if mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN
