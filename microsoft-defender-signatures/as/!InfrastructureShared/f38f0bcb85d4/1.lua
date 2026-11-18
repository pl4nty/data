-- Threat: !InfrastructureShared
-- Name: f38f0bcb85d4
-- Type: 21

if mp.getfilesize() > 100000 and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
