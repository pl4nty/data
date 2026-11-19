-- Threat: !InfrastructureShared
-- Name: 3178f2e3da20
-- Type: 21

if mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
