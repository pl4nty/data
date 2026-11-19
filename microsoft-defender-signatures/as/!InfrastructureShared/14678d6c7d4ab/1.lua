-- Threat: !InfrastructureShared
-- Name: 14678d6c7d4ab
-- Type: 21

if mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
