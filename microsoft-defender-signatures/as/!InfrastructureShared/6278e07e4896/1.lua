-- Threat: !InfrastructureShared
-- Name: 6278e07e4896
-- Type: 21

if mp.getfilesize() >= 5120 and mp.getfilesize() <= 6144 then
  return mp.INFECTED
end
return mp.CLEAN
