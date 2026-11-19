-- Threat: !InfrastructureShared
-- Name: 80785df0be9a
-- Type: 21

if mp.getfilesize() < 28672 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
