-- Threat: !InfrastructureShared
-- Name: 7761b3fbed39
-- Type: 21

if mp.getfilesize() < 2000 then
  return mp.INFECTED
end
return mp.CLEAN
