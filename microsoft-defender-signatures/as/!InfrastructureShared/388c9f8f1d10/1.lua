-- Threat: !InfrastructureShared
-- Name: 388c9f8f1d10
-- Type: 21

if mp.getfilesize() > 10485760 then
  return mp.CLEAN
end
return mp.INFECTED
