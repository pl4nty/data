-- Threat: !InfrastructureShared
-- Name: 18f78651f7794
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
