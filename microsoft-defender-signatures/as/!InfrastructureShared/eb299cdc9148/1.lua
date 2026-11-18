-- Threat: !InfrastructureShared
-- Name: eb299cdc9148
-- Type: 21

if mp.getfilesize() <= 33792 and mp.getfilesize() >= 30720 then
  return mp.INFECTED
end
return mp.CLEAN
