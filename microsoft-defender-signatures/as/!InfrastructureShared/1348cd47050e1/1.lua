-- Threat: !InfrastructureShared
-- Name: 1348cd47050e1
-- Type: 21

if mp.getfilesize() <= 1800000 then
  return mp.INFECTED
end
return mp.CLEAN
