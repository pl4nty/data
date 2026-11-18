-- Threat: !InfrastructureShared
-- Name: 9178ee92472d
-- Type: 21

if mp.getfilesize() > 10485760 then
  return mp.CLEAN
end
return mp.INFECTED
