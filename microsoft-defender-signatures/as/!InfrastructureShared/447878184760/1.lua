-- Threat: !InfrastructureShared
-- Name: 447878184760
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
