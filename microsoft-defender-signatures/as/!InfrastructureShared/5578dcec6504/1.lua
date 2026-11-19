-- Threat: !InfrastructureShared
-- Name: 5578dcec6504
-- Type: 21

if mp.getfilesize() < 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
