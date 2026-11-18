-- Threat: !InfrastructureShared
-- Name: 18a8f8ece355b
-- Type: 21

if mp.getfilesize() > 155000 and mp.getfilesize() < 195000 then
  return mp.INFECTED
end
return mp.CLEAN
