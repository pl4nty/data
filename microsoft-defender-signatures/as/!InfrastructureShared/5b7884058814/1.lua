-- Threat: !InfrastructureShared
-- Name: 5b7884058814
-- Type: 21

if mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
