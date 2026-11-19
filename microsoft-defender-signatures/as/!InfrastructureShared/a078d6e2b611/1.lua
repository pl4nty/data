-- Threat: !InfrastructureShared
-- Name: a078d6e2b611
-- Type: 21

if mp.getfilesize() > 57344 and mp.getfilesize() < 65024 then
  return mp.INFECTED
end
return mp.CLEAN
