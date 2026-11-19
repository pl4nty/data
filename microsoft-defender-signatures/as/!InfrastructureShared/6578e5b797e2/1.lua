-- Threat: !InfrastructureShared
-- Name: 6578e5b797e2
-- Type: 21

if mp.getfilesize() > 10485760 then
  return mp.CLEAN
end
return mp.INFECTED
