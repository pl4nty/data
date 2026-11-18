-- Threat: !InfrastructureShared
-- Name: 4978ec58b054
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
