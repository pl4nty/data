-- Threat: !InfrastructureShared
-- Name: f97879003cc3
-- Type: 21

if mp.getfilesize() < 60000 then
  return mp.INFECTED
end
return mp.CLEAN
