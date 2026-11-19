-- Threat: !InfrastructureShared
-- Name: 6778eedd4937
-- Type: 21

if mp.getfilesize() < 6000000 and mp.getfilesize() > 4000000 then
  return mp.INFECTED
end
return mp.CLEAN
