-- Threat: !InfrastructureShared
-- Name: 8f787fb4ec75
-- Type: 21

if mp.getfilesize() >= 601088 and mp.getfilesize() <= 619520 then
  return mp.INFECTED
end
return mp.CLEAN
