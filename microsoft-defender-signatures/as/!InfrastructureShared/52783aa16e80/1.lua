-- Threat: !InfrastructureShared
-- Name: 52783aa16e80
-- Type: 21

if mp.getfilesize() > 33554432 then
  return mp.CLEAN
end
return mp.INFECTED
