-- Threat: !InfrastructureShared
-- Name: 55400eb407c9
-- Type: 21

if mp.getfilesize() < 80000 then
  return mp.INFECTED
end
return mp.CLEAN
