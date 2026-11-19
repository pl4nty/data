-- Threat: !InfrastructureShared
-- Name: 5540256dfaf2
-- Type: 21

if mp.getfilesize() > 5000 then
  return mp.CLEAN
end
return mp.INFECTED
