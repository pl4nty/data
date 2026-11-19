-- Threat: !InfrastructureShared
-- Name: 3b782e6cc866
-- Type: 21

if mp.getfilesize() >= 298752 and mp.getfilesize() <= 302848 then
  return mp.INFECTED
end
return mp.CLEAN
