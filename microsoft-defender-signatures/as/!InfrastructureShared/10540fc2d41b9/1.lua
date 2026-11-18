-- Threat: !InfrastructureShared
-- Name: 10540fc2d41b9
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
