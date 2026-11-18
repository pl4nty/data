-- Threat: !InfrastructureShared
-- Name: 3c8caf112aa2
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
