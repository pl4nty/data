-- Threat: !InfrastructureShared
-- Name: 84785cc70381
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
