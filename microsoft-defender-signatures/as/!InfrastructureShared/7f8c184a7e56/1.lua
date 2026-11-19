-- Threat: !InfrastructureShared
-- Name: 7f8c184a7e56
-- Type: 21

if mp.getfilesize() > 3145728 then
  return mp.CLEAN
end
return mp.INFECTED
