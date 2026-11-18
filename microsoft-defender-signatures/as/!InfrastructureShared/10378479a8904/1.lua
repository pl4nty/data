-- Threat: !InfrastructureShared
-- Name: 10378479a8904
-- Type: 21

if mp.getfilesize() < 10485760 then
  return mp.INFECTED
end
return mp.CLEAN
