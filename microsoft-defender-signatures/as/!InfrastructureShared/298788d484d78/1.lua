-- Threat: !InfrastructureShared
-- Name: 298788d484d78
-- Type: 21

if mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
