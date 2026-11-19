-- Threat: !InfrastructureShared
-- Name: ac781a026bc7
-- Type: 21

if mp.getfilesize() >= 425216 and mp.getfilesize() <= 445696 then
  return mp.INFECTED
end
return mp.CLEAN
