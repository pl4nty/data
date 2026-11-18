-- Threat: !InfrastructureShared
-- Name: 872920e327fb
-- Type: 21

if mp.getfilesize() > 409600 and mp.getfilesize() < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
