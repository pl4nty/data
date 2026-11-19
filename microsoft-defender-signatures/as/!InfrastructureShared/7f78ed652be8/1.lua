-- Threat: !InfrastructureShared
-- Name: 7f78ed652be8
-- Type: 21

if mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
