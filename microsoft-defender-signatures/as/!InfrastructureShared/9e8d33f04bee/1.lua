-- Threat: !InfrastructureShared
-- Name: 9e8d33f04bee
-- Type: 21

if mp.getfilesize() > 50000 and mp.getfilesize() < 250000 then
  return mp.INFECTED
end
return mp.CLEAN
