-- Threat: !InfrastructureShared
-- Name: 9478cd452029
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
