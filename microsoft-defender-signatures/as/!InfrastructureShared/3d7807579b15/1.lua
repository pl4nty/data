-- Threat: !InfrastructureShared
-- Name: 3d7807579b15
-- Type: 21

if mp.getfilesize() < 151552 then
  return mp.INFECTED
end
return mp.CLEAN
