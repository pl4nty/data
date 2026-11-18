-- Threat: !InfrastructureShared
-- Name: 467883fa0855
-- Type: 21

if mp.getfilesize() < 8192 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
