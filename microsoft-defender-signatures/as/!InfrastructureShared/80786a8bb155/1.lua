-- Threat: !InfrastructureShared
-- Name: 80786a8bb155
-- Type: 21

if mp.getfilesize() >= 200704 and mp.getfilesize() <= 204800 then
  return mp.INFECTED
end
return mp.CLEAN
