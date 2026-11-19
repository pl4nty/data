-- Threat: !InfrastructureShared
-- Name: 14d78ae1c1a11
-- Type: 21

if mp.getfilesize() > 7500000 and mp.getfilesize() < 9000000 then
  return mp.INFECTED
end
return mp.CLEAN
